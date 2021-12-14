//
//  NetworkDataFetcher.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 13.12.2021.
//

import Foundation

final class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    func fetchTracks(urlString: String, completion: @escaping ([GamesModel]) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let games = try JSONDecoder().decode([GamesModel].self, from: data)
                    DataManager.shared.saveGames(games: games)
                    completion(games)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion([])
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                completion(DataManager.shared.addGames)
            }
        }
    }
}
