//
//  ViewController.swift
//  AutoLayoutsComplete
//
//  Created by Krithick Santhosh on 04/01/23.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
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
    
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }() // its always dangerous in production environemnt to copy paste random codes that "look similar"
    
    private let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .systemBlue
        pc.pageIndicatorTintColor = .gray
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headTextView)
        setupLayout()
        setupBottomControls()
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Using multipliers on the above view
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImage)
        bearImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImage.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true
        bearImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        headTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        headTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    private func setupBottomControls() {
//        view.addSubview(previousButton)
//        previousButton.backgroundColor = .red
//        previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
//        bottomControlsStackView.axis = .vertical
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

