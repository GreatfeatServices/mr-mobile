//
//  CharacterListViewController.swift
//  RickAndMortyInfo
//
//  Created by Richmond Ko on 11/04/2018.
//  Copyright © 2018 Richmond Ko. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {

    // MARK: - Stored
    private let CARD_RATIO: CGFloat = 1.618
    private let COLLECTION_VIEW_CARD_SPACING: CGFloat = 16.0
    private let COLLECTION_VIEW_NO_OF_COLUMNS: CGFloat = 2.0
    private let COLLECTION_VIEW_NO_OF_HORIZONTAL_SPACES: CGFloat = 3.0
    private var charactersResponse: CharacterResponse?

    // MARK: - Stored (IBOutlet)
    @IBOutlet var charactersCollectionView: UICollectionView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    // MARK: - App View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCharactersCollectionView()
        getCharacters()
    }

    // MARK: - Instance
    private func configureCharactersCollectionView() {
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
    }

    private func getCharacters() {
        startLoading()
        CharacterService.shared.getCharacters { [weak self] (charactersResponse, error) in
            self?.stopLoading()
            if let error = error {
                self?.presentErrorAlertController(error: error)
            } else if let charactersResponse = charactersResponse {
                self?.charactersResponse = charactersResponse
                self?.charactersCollectionView.reloadData()
            }
        }
    }

    private func startLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    private func stopLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let charactersResponse = charactersResponse else {
            return 0
        }
        return charactersResponse.results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let charactersResponse = charactersResponse else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.characterCell.rawValue, for: indexPath) as! CharacterCollectionViewCell
        cell.layer.cornerRadius = 5.0
        cell.clipsToBounds = true
        cell.configure(withCharacter: charactersResponse.results[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - (COLLECTION_VIEW_CARD_SPACING * COLLECTION_VIEW_NO_OF_HORIZONTAL_SPACES)) / COLLECTION_VIEW_NO_OF_COLUMNS
        let height = width * CARD_RATIO
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return COLLECTION_VIEW_CARD_SPACING
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return COLLECTION_VIEW_CARD_SPACING
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(COLLECTION_VIEW_CARD_SPACING, COLLECTION_VIEW_CARD_SPACING, COLLECTION_VIEW_CARD_SPACING, COLLECTION_VIEW_CARD_SPACING)
    }
}
