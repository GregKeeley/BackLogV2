//
//  GameModel.swift
//  BackLogV2
//
//  Created by Gregory Keeley on 12/30/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct GameRAWG: Decodable {
    let name: String
    let released: String
}

struct GameIGDBSearchResults: Decodable {
    let id: Int
    let name: String
}
