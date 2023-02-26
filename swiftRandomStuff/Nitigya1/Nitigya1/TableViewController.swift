//
//  TableViewController.swift
//  Nitigya1
//
//  Created by Krithick Santhosh on 09/01/23.
//

import UIKit

class TableViewController: UITableViewController {
    
    var users = [User](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchData () {
        Networking.sharedInstance.getUsers{[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let usersRes):
                self?.users = usersRes
            }
        }
    }
    fileprivate func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserCell.self, forCellReuseIdentifier: "Cell") // register tableView cells as cell
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.allowsSelection = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let add = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self, action: #selector(goToSecondScreen))
        self.navigationItem.rightBarButtonItem = add
    }
    
    @objc func goToSecondScreen() {
        let sampleScreen = SampleScreen()
        self.navigationController?.present(sampleScreen, animated: true)
    }
    
    func someNetworkCall() -> Data {
        return Data()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User list ",users)
        fetchData()
        setupTableView()
        self.title = "Users"
        
        do { // decoding part
            let decoder = JSONDecoder()
            var data = someNetworkCall()
            let user2 = try decoder.decode(User.self, from: data)
            
            let users = try decoder.decode([User].self, from: data)
            users.forEach({(user) in
                print(user)
            })
        } catch {
            print("Something went wrong")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UserCell
        cell.layer.cornerRadius = 15
        let user = users[indexPath.row]
        cell.set(res : user)
        return cell
    }
}
