//
//  CharacterService.swift
//  RickAndMortyInfo
//
//  Created by Richmond Ko on 11/04/2018.
//  Copyright © 2018 Richmond Ko. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

class CharacterService {
    private init() {}
    static let shared = CharacterService()

    func getCharacters(page: Int?, withBlock completion: @escaping (CharacterResponse?, Error?) -> Void) {
        Alamofire.request(Router.getCharacters(page: page)).responseDecodableObject(decoder: JSONDecoder()) { (response: DataResponse<CharacterResponse>) in
            switch response.result {
            case .success(let characterResponse):
                completion(characterResponse, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
