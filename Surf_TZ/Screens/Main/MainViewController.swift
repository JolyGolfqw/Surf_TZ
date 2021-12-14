//
//  ViewController.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 12.12.2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Propreties
    let networkDataFetcher = NetworkDataFetcher()
    var gamesModel = [GamesModel]()
    
    // MARK: - UI
    private let collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .vertical
        layoutCollection.sectionInset.left = 12
        layoutCollection.sectionInset.right = 12
        layoutCollection.minimumLineSpacing = 10
        layoutCollection.minimumInteritemSpacing = 10
        layoutCollection.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 20)
        
        let height: CGFloat = 240.0
        let paddingItem: CGFloat = 10.0
        let widht = (UIScreen.main.bounds.width - (layoutCollection.sectionInset.left + layoutCollection.sectionInset.right + paddingItem)) / 2
        
        layoutCollection.itemSize = CGSize(width: widht, height: height)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCollection)
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset.top = 0
        collectionView.contentInset.bottom = 20
        collectionView.backgroundColor = #colorLiteral(red: 0.1579894722, green: 0.173040539, blue: 0.1941367686, alpha: 1)
        collectionView.registerNib(MainViewCollectionViewCell.self)
        
        return collectionView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.emptyGamesData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.1579894722, green: 0.173040539, blue: 0.1941367686, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.title = "Games"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - DataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamesModel.prefix(20).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(MainViewCollectionViewCell.self, indexPath: indexPath)
        
        let games = gamesModel[indexPath.row]
        
        cell.iconGame.downloaded(from: games.thumbnail)
        cell.titleGameLabel.text = games.title
        cell.descriptionLabel.text = games.short_description
        cell.genreLabel.text = games.genre
        
        return cell
    }
}

// MARK: - Delegate
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goToDetailViewController(indexPath)
    }
}

// MARK: - Setup
private extension MainViewController {
    
    private func setup() {
        setupUICollectionView()
        getGamesData()
        self.view.backgroundColor = #colorLiteral(red: 0.1579894722, green: 0.173040539, blue: 0.1941367686, alpha: 1)
    }
    
    private func getGamesData() {
        let urlString = "https://www.freetogame.com/api/games"
        networkDataFetcher.fetchTracks(urlString: urlString) { result in
            DispatchQueue.main.async {
                self.gamesModel = result
                self.collectionView.reloadData()
            }
        }
    }
    
    private func goToDetailViewController(_ indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.gameModel = self.gamesModel[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func emptyGamesData() {
        if DataManager.shared.addGames.isEmpty {
            let alert = UIAlertController(title: "Данные не загружены!", message: "Пожалуйста подключитесь к сети и перезапустите приложение!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
            self.collectionView.reloadData()
        } else {
            return
        }
    }
    
    private func setupUICollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


