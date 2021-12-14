//
//  DataManager.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 14.12.2021.
//

import Foundation

final class DataManager {
    
    let defaults = UserDefaults.standard
    
    static let shared = DataManager()
    
    var addGames: [GamesModel] {
        get {
            if let data = defaults.value(forKey: "addGames") as? Data {
                return try! PropertyListDecoder().decode([GamesModel].self, from: data)
            } else {
                return [GamesModel]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set (data, forKey: "addGames")
            }
        }
    }
    
    // MARK: - Save Games
    func saveGames(games: [GamesModel]) {
        addGames.insert(contentsOf: games, at: 0)
    }
}
