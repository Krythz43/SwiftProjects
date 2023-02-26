//
//  PageCell.swift
//  AutoLayoutsComplete
//
//  Created by Krithick Santhosh on 05/01/23.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var bearImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "bear_first"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let headTextView :UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.text = "There are going to be so many cats"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)'
        
        let attributedText = NSMutableAttributedString(string: "There are going to be so many cats!",attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSMutableAttributedString(string: "\n\nITS GONNA BE RAINING!", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.purple]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Using multipliers on the above view
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImage)
        bearImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImage.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true
        bearImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        addSubview(headTextView)
        headTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        headTextView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        headTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        headTextView.bottomAnchor.constraint(equalTo:   bottomAnchor).isActive = true
        
    }
}
