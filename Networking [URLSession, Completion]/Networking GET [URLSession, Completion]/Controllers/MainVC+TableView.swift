//
//  MainVC-TableView.swift
//  Networking [URLSession, Completion]
//
//  Created by e1ernal on 23.12.2023.
//

import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        userTableView.delegate = self
        userTableView.dataSource = self
        
        view.addSubview(userTableView)
        
        NSLayoutConstraint.activate([
            userTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        userTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userData == nil {
            return 0
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if userData == nil {
            return "No user data"
        } else {
            return "Networking with @escaping Completion"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let user = userData?.results[0] else {
            return cell
        }
        
        var mainText: String = ""
        var secondaryText: String = ""
        
        switch indexPath.row {
        case 0:
            mainText = "\(user.name.title) \(user.name.first) \(user.name.last)"
            secondaryText = "Name"
        case 1:
            mainText = user.gender
            secondaryText = "Gender"
        case 2:
            mainText = user.email
            secondaryText = "Email"
        default:
            mainText = ""
            secondaryText = ""
            print(indexPath.row)
        }
        var content = cell.defaultContentConfiguration()
        content.text = mainText
        content.secondaryText = secondaryText
        cell.contentConfiguration = content
        return cell
    }
}
