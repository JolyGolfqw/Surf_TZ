//
//  GamesModel.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 13.12.2021.
//

import Foundation

struct GamesModel: Codable {
    var title: String
    var thumbnail: String
    var short_description: String
    var genre: String
    var platform: String
    var publisher: String
    var release_date: String
    var developer: String
}
