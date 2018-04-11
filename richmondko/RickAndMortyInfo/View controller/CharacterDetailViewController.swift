//
//  CharacterDetailViewController.swift
//  RickAndMortyInfo
//
//  Created by Richmond Ko on 11/04/2018.
//  Copyright © 2018 Richmond Ko. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    // MARK: - Stored
    var character: Character?

    // MARK: - Stored (IBOutlet)
    @IBOutlet var characterAvatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var idAndCreatedLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var lastLocationLabel: UILabel!
    @IBOutlet var episodeListLabel: UILabel!

    // MARK: - App View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCharacterData()
        configureAvatarImageView()
    }

    // MARK: - Instance
    private func configureAvatarImageView() {
        characterAvatarImageView.layer.cornerRadius = characterAvatarImageView.frame.size.width / 2
        characterAvatarImageView.layer.masksToBounds = true
    }

    private func setCharacterData() {
        guard let character = character else { return }
        if let url = URL(string: character.image) {
            characterAvatarImageView.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.2))], progressBlock: nil, completionHandler: nil)
        } else {
            characterAvatarImageView.image = nil
        }

        nameLabel.text = character.name
        idAndCreatedLabel.text = "id: \(character.id) - created at \(character.created)"
        statusLabel.text = character.status
        speciesLabel.text = character.species
        genderLabel.text = character.gender
        originLabel.text = character.origin.name
        lastLocationLabel.text = character.location.name
        episodeListLabel.text = "\(character.episode.debugDescription)"
    }
}
