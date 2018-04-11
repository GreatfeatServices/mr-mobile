//
//  Info.swift
//  RickAndMortyInfo
//
//  Created by Richmond Ko on 11/04/2018.
//  Copyright © 2018 Richmond Ko. All rights reserved.
//

import Foundation

struct Info: Codable {
    let count: UInt
    let pages: UInt
    let next: String
    let prev: String
}
