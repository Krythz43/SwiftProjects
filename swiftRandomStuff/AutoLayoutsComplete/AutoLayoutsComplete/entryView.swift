//
//  entryView.swift
//  AutoLayoutsComplete
//
//  Created by Krithick Santhosh on 26/01/23.
//

import UIKit

class EntryView : UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = SwipingController(collectionViewLayout: layout)
        
        let additionalView = UIView()
        view.addSubview(additionalView)
        
        additionalView.translatesAutoresizingMaskIntoConstraints = false
        additionalView.backgroundColor = .systemBlue
        additionalView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -250).isActive = true
        additionalView.topAnchor.constraint(equalTo: view.topAnchor,constant: 250).isActive = true
        additionalView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        additionalView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        additionalView.addSubview(swipingController.view)
    }
}
