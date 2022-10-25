//
//  ViewController.swift
//  ChallengeSpm
//
//  Created by Fernanda Perovano on 25/10/22.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: LYFE CICLE
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let homeViewController = HomeViewController()
        let addViewController = AddViewController()
        let findViewController = FindViewController()
        let favoritesViewController = FavoritesViewController()
        let controllers = [homeViewController, addViewController, findViewController, favoritesViewController]
        self.viewControllers = controllers
        self.setUpTabbarController()
    }
    
    private func setUpTabbarController() {
        self.setViewControllers([HomeViewController(), AddViewController(), FindViewController(), FavoritesViewController()], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .systemPurple
        
        guard let itens = tabBar.items else { return }
        itens[0].title = "Início"
        itens[0].image = UIImage(systemName: "house.fill")
        itens[1].title = "Adicionar"
        itens[1].image = UIImage(systemName: "plus.circle.fill")
        itens[2].title = "Buscar"
        itens[2].image = UIImage(systemName: "magnifyingglass")
        itens[3].title = "Favoritos"
        itens[3].image = UIImage(systemName: "heart.fill")
    }
}


