//
//  ViewController.swift
//  Networking [URLSession, Completion]
//
//  Created by e1ernal on 23.12.2023.
//

import UIKit

class MainVC: UIViewController {

    let userTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var userData: UserResults?
    
    override func viewWillAppear(_ animated: Bool) {
        getUserData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    private func makeUI() {
        setupNavigationView()
        setupTableView()
    }
}
