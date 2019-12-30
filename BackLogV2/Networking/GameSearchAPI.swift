//
//  GameSearchAPI.swift
//  BackLogV2
//
//  Created by Gregory Keeley on 12/30/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct RecipeSearchAPI {
    
    static func searchGames(searchQuery: String, completion: @escaping (Result<[Game], AppError>) -> ()) {
        let searchEndpoint = "https://api-v3.igdb.com/search/?user-key=\(SecretAPI.value)"
        guard let url = URL(string: searchEndpoint) else {
            completion(.failure(.badURL(searchEndpoint)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let searchResults = try JSONDecoder().decode([Game].self, from: data)
                    completion(.success(searchResults))
                } catch {
                    completion(.failure(.decodingError(error))) 
                }
            }
        }
    }
}
