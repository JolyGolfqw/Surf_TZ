//
//  MainCollectionViewCell.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 13.12.2021.
//

import UIKit

final class MainViewCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var iconGame: UIImageView!
    @IBOutlet weak var titleGameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconGame.image = nil
    }
    
    // MARK: - Update UI
    private func updateUI() {
        wrapperView.layer.cornerRadius = 15
        wrapperView.clipsToBounds = true
        wrapperView.layer.borderWidth = 0.5
        
        iconGame.clipsToBounds = true
        
        genreLabel.layer.cornerRadius = 5
        genreLabel.clipsToBounds = true
    }
}
