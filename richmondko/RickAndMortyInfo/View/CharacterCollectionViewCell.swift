//
//  CharacterCollectionViewCell.swift
//  RickAndMortyInfo
//
//  Created by Richmond Ko on 11/04/2018.
//  Copyright © 2018 Richmond Ko. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var characterAvatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!

    func configure(withCharacter character: Character) {
        if let url = URL(string: character.image) {
            characterAvatarImageView.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.2))], progressBlock: nil, completionHandler: nil)
        } else {
            characterAvatarImageView.image = nil
        }

        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        genderLabel.text = character.gender
    }

}

