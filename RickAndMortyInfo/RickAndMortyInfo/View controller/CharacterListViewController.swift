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

    // MARK: - Stored (IBOutlet)
    @IBOutlet var charactersCollectionView: UICollectionView!

    // MARK: - App View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCharactersCollectionView()
    }

    // MARK: - Instance
    private func configureCharactersCollectionView() {
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
    }
}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.characterCell.rawValue, for: indexPath)
        cell.layer.cornerRadius = 5.0
        cell.clipsToBounds = true
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
