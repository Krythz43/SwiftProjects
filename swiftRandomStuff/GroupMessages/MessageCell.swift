//
//  MessageCell.swift
//  GroupMessages
//
//  Created by Krithick Santhosh on 29/01/23.
//

import UIKit

struct chatMessages {
    let text: String
    let inComing: Bool
    let date: Date
}

class MessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let messageBubbleView = UIView()
    
    var chatMessage: chatMessages! {
        didSet{
            messageLabel.text = chatMessage.text
            
            messageBubbleView.backgroundColor = chatMessage.inComing ? .white : .darkGray
            messageLabel.textColor = chatMessage.inComing ? .black : .white
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        messageBubbleView.backgroundColor = .yellow
        messageBubbleView.layer.cornerRadius = 5
        backgroundColor = .clear
        addSubview(messageBubbleView)
        addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -32).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        messageLabel.text = "Some random message Some random message Some random message Some random message Some random message Some random message Some random message Some random message"
        messageLabel.numberOfLines = 0
        
        messageBubbleView.translatesAutoresizingMaskIntoConstraints = false
        messageBubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor,constant: -16).isActive = true
        messageBubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 16).isActive = true
        messageBubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor,constant: -16).isActive = true
        messageBubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor
                                                    ,constant: 16).isActive = true
        
    }
    
    var leadingContstraint : NSLayoutConstraint!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
