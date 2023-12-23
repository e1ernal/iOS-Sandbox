//
//  MainVC+NavigationView.swift
//  Networking [URLSession, Completion]
//
//  Created by e1ernal on 23.12.2023.
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
        NetworkService.shared.fetchData { result in
            switch result {
            case.success(let usersData):
                self.userData = usersData
                print(usersData.results[0])
                DispatchQueue.main.async {
                    self.userTableView.reloadData()
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
