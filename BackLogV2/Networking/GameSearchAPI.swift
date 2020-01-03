//
//  GameSearchAPI.swift
//  BackLogV2
//
//  Created by Gregory Keeley on 12/30/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct GameSearchAPI {
    static func searchGames(for searchQuery: String, completion: @escaping (Result<[Game], AppError>) -> ()) {
        let gameSearchEndpoint = "https://rawg-video-games-database.p.rapidapi.com/games/\(searchQuery)"
        guard let url = URL(string: gameSearchEndpoint) else {
            completion(.failure(.badURL(gameSearchEndpoint)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let searchResults = try JSONDecoder().decode([Game].self, from: data)
                    
                    completion(.success(searchResults))
                } catch {
                    
                }
            }
        }
    }
}
