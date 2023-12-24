//
//  ViewController.swift
//  Networking POST [Async Await]
//
//  Created by e1ernal on 24.12.2023.
//

import UIKit

class MainVC: UIViewController {
    
    let toDosTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let alert = UIAlertController(title: nil, message: "Please wait ...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
    var todos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        setupTableView()
    }
    
    private func makeUI() {
        title = "ToDos"
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self,
                                                            action: #selector(requestForToDos))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(addNewToDo))
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
    }
    
    @objc private func requestForToDos() {
        Task {
            do {
                present(alert, animated: true, completion: nil)
                let data = try await NetworkService.shared.getAllToDos()
                self.todos = data
                self.toDosTableView.reloadData()
                dismiss(animated: false, completion: nil)
            } catch {
                alert.message = error.localizedDescription
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.dismiss(animated: false, completion: nil)
                }
            }
        }
    }
    
    @objc private func addNewToDo() {
        let alert = UIAlertController(title: "New ToDo", message: "", preferredStyle: .alert)
        let loginAction = UIAlertAction(title: "Create", style: .default, handler: { (action) -> Void in
            guard let userIdStr = alert.textFields?[0].text,
                  let title = alert.textFields?[1].text,
                  let userId = Int(userIdStr)
            else { return }
            let newToDo = ToDo.ToDoDTO(userId: userId, title: title, completed: false)
            Task {
                let todo = try await NetworkService.shared.createToDo(newToDo: newToDo)
                print(todo.id)
                print(todo.title)
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action) -> Void in })
        
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "User ID"
            textField.keyboardType = .numberPad
        }
        
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "Title"
            textField.keyboardType = .default
        }
        
        alert.addAction(cancel)
        alert.addAction(loginAction)
        self.present(alert, animated: true, completion: nil)
    }
}

