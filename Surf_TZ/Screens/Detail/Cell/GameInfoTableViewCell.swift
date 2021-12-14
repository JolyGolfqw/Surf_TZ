//
//  GameInfoTableViewCell.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 13.12.2021.
//

import UIKit

final class GameInfoTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
}
