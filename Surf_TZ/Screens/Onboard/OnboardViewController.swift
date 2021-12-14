//
//  OnboardViewController.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 12.12.2021.
//

import UIKit

final class OnboardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var goButtonOutlet: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButtonOutlet.layer.cornerRadius = 15
        goButtonOutlet.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Action
    @IBAction func goToMain(_ sender: Any) {
        let mainViewController = MainViewController()
        navigationController?.setViewControllers([mainViewController], animated: true)
    }
}
