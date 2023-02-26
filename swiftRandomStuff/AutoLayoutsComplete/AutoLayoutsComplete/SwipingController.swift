//
//  SwipingController.swift
//  AutoLayoutsComplete
//
//  Created by Krithick Santhosh on 05/01/23.
//

import UIKit



class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "bear_first", headerText: "THERE ARE GOING TO BE SO MANY CATS"),
        Page(imageName: "catopen", headerText: "SOME VERY VERY VERY CUTE CATS"),
        Page(imageName: "catclosed", headerText: "SOME VERY VERY CHUBBY ONES TOOOO" )
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
                    as! PageCell
        // we cant directly use this because its an UI something and cant be used for properties
        
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        let page = pages[indexPath.item]
        cell.bearImage.image = UIImage(named: page.imageName)
        cell.headTextView.text = page.headerText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
