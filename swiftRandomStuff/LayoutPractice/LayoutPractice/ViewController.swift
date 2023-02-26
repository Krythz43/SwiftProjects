//
//  ViewController.swift
//  LayoutPractice
//
//  Created by Krithick Santhosh on 03/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let myView : UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false;
        myView.backgroundColor = .link
        return myView
    }()
    
    private let secondView : UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false;
        myView.backgroundColor = .systemRed
        return myView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.addSubview(secondView)
        addConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]() // Initializing constraints
        
        constraints.append(myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(secondView.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.5))
        constraints.append(secondView.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 0.5))
        
        constraints.append(secondView.centerXAnchor.constraint(equalTo: myView.centerXAnchor))
        constraints.append(secondView.centerYAnchor.constraint(equalTo: myView.centerYAnchor))
        
        NSLayoutConstraint.activate(constraints) // Activates constraints
    }
}

