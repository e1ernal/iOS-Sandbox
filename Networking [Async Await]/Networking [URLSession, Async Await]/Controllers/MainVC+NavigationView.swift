//
//  MainVC+NavigationView.swift
//  Networking [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import UIKit

extension MainVC {
    func setupNavigationView() {
        title = "User"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self,
                                                            action: #selector(getUserData))
    }
    
    @objc func getUserData() {
        Task {
            do {
                let result = try await NetworkService.shared.fetchData()
                self.userData = result
                print(result.results[0])
                self.userTableView.reloadData()
            } catch is NetworkError {
                
            }
        }
    }
}

