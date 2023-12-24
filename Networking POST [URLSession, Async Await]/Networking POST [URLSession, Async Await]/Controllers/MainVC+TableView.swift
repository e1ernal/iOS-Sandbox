//
//  MainVC+TableView.swift
//  Networking POST [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        
        view.addSubview(toDosTableView)
        
        NSLayoutConstraint.activate([
            toDosTableView.topAnchor.constraint(equalTo: view.topAnchor),
            toDosTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toDosTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toDosTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        toDosTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return todos.isEmpty ? 0 : todos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.isEmpty ? 0 : 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return todos.isEmpty ? "" : "id: \(todos[section].id)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard !todos.isEmpty else {
            return cell
        }
        
        var dataText: String
        var labelText: String
        
        switch indexPath.row {
        case 0:
            dataText = "\(todos[indexPath.section].userId)"
            labelText = "userId"
        case 1:
            dataText = "\(todos[indexPath.section].title)"
            labelText = "title"
        case 2:
            dataText = "\(todos[indexPath.section].completed)"
            labelText = "completed"
        default:
            dataText = ""
            labelText = ""
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = dataText
        content.secondaryText = labelText
        cell.contentConfiguration = content
        return cell
    }
}
