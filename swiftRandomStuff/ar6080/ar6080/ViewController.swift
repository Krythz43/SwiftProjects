//
//  ViewController.swift
//  ar6080
//
//  Created by Krithick Santhosh on 04/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .cyan
        
        view.addSubview(view2)
        
        view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        view2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.backgroundColor = .white
        
        view.addSubview(label)
        
        print("greater than system spacing of leading anchor",label.centerXAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.2))
        
        label.centerXAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.8).isActive = true
        label.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1.8).isActive = true
    }


}

