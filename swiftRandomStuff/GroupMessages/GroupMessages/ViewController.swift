//
//  ViewController.swift
//  GroupMessages
//
//  Created by Krithick Santhosh on 29/01/23.
//

import UIKit

class ViewController: UITableViewController {

    
    let textMessages = [
        chatMessages(text: "Here is an example message", inComing: true,date: Date()),
        chatMessages(text: "Here is another example message", inComing: false,date: Date()),
        chatMessages(text: "Here is a third example message but  this is going to be slightly longer jsut so that lonfe messages acan be texted", inComing: true,date: Date()),
        chatMessages(text: "yo", inComing: false,date: Date())
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(MessageCell.self, forCellReuseIdentifier: "id")
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    override func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! MessageCell
        cell.chatMessage = textMessages[indexPath.row]
        
        return cell
    }


}

