//
//  GameSearchAPI.swift
//  BackLogV2
//
//  Created by Gregory Keeley on 12/30/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct GameSearchAPI {
    static func searchGamesRAWG(for searchQuery: String, completion: @escaping (Result<[GameRAWG], AppError>) -> ()) {
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
                    let searchResults = try JSONDecoder().decode([GameRAWG].self, from: data)
                    
                    completion(.success(searchResults))
                } catch {
                    
                }
            }
        }
    }
    static func searchIGDB(for searchQuery: String, completion: @escaping (Result<[GameIGDBSearchResults], AppError>) -> ()) {
        //        let postData = NSData(data: "search "Halo"; fields name;".data(using: String.Encoding.utf8)!)
        //        let searchEndpointURL = ""
        //    }
        
        let headers = [
            "user-key": "\(SecretAPI.igdbKey)",
            "Content-Type": "text/plain",
            "User-Agent": "PostmanRuntime/7.20.1",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "f130c2f1-fe4c-4bb7-8335-2d32894a5b5c,03987916-4aeb-4dae-8157-4eb929c9746d",
            "Host": "api-v3.igdb.com",
            "Accept-Encoding": "gzip, deflate",
            "Content-Length": "27",
            "Cookie": "__cfduid=dad5ae02dfd61eb8dde5f9df91857e2821574699021",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        let postData = NSData(data: "search \("\(searchQuery)"); fields name;".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api-v3.igdb.com/games/")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        NetworkHelper.shared.performDataTask(with: request as URLRequest) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    var searchResults = try JSONDecoder().decode([GameIGDBSearchResults].self, from: data)
                    searchResults = searchResults.sorted { $0.name > $1.name }
                    completion(.success(searchResults))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
