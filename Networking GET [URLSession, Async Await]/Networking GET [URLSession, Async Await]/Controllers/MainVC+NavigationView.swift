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
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
    }
    
    @objc func getUserData() {
        Task {
            do {
                present(alert, animated: true, completion: nil)
                let result = try await NetworkService.shared.fetchData()
                self.userData = result
                print(result.results[0])
                self.userTableView.reloadData()
                dismiss(animated: false, completion: nil)
            } catch is NetworkError {
              print("Some Network Error")
            }
        }
    }
}

