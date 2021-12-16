//
//  DetailViewController.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 12.12.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var gameModel: GamesModel!
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.registerNib(GameInfoTableViewCell.self)
        tableView.registerNib(GameIconTableViewCell.self)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.195925504, green: 0.2199897766, blue: 0.2413648963, alpha: 1)
        
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
}

// MARK: - Data Source
extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        GamesCellModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iconCell = tableView.dequeue(GameIconTableViewCell.self, indexPath: indexPath)
        let infoCell = tableView.dequeue(GameInfoTableViewCell.self, indexPath: indexPath)
        
        let item = GamesCellModel(rawValue: indexPath.row)
        
        switch item {
        case .gameIcon:
            iconCell.iconGame.downloaded(from: gameModel.thumbnail)
            return iconCell
        default:
            infoCell.descriptionTitle.text = gameModel.short_description
            infoCell.genreLabel.text = ("Жанр:\n\(gameModel.genre)")
            infoCell.platformLabel.text = ("Платформа:\n\(gameModel.platform)")
            infoCell.publisherLabel.text = "Издатель:\n" + gameModel.publisher
            infoCell.developerLabel.text = ("Разработчик:\n\(gameModel.developer)")
            infoCell.releaseDateLabel.text = ("Дата выхода:\n\(gameModel.release_date)")
            return infoCell
        }
    }
}

// MARK: - Setup
extension DetailViewController {
    
    func setup() {
        setupUITableView()
        navigationItem.title = gameModel.title
    }
    
    func setupUITableView() {
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
