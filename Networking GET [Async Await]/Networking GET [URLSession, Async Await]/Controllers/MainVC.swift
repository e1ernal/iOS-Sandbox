//
//  MainVC.swift
//  Networking [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import UIKit

class MainVC: UIViewController {

    let userTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let alert = UIAlertController(title: nil, message: "Please wait ...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
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
