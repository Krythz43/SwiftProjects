//
//  ViewController.swift
//  UserDefaults
//
//  Created by Krithick Santhosh on 13/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Even if we find multiple instances we access the same thing
    let defaults = UserDefaults.standard
    
    struct keys{
        static let backgroundColour = "bgColour"
        static let crushName = "crushName"
    }
    
    let button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Changes background colour", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(changeBackgroundColour), for: .touchUpInside)
        return button
    }()
    
    func checkBackground() -> Bool {
        return view.backgroundColor?.accessibilityName ?? "" == "white"
    }
    
    @objc func changeBackgroundColour(){
        view.backgroundColor = retriveStyle() ? .black: .white
        print(retriveStyle())
        saveStyles()
        print(retriveStyle())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        changeBackgroundColour()
        changeBackgroundColour()
        setupButton()
    }
    
    func setupButton() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func saveStyles(){
        print("saving to userDefaults")
        defaults.set(checkBackground(),forKey: keys.backgroundColour)
//        defaults.set(checkBackground(),forKey: "colourCheck")
    }
    
    func retriveStyle() -> Bool {
        let bgColour = defaults.bool(forKey: keys.backgroundColour)
        return bgColour
    }
}

