//
//  SampleScreen.swift
//  Nitigya1
//
//  Created by Krithick Santhosh on 10/01/23.
//

import UIKit

fileprivate func setupTextField(_ textField: UITextField, placeHolder: String) {
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeHolder
    textField.keyboardType = UIKeyboardType.default
    textField.returnKeyType = UIReturnKeyType.done
    textField.autocorrectionType = UITextAutocorrectionType.no
    textField.font = UIFont.systemFont(ofSize: 20)
    textField.textColor = UIColor.label
    textField.tintColor = UIColor.secondaryLabel
    textField.attributedPlaceholder = NSAttributedString(string: placeHolder,attributes: [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel])
    textField.borderStyle = UITextField.BorderStyle.roundedRect
    textField.layer.borderColor = UIColor.secondaryLabel.cgColor
    textField.layer.borderWidth = 0.5
    textField.layer.cornerRadius = 5
    textField.clearButtonMode = UITextField.ViewMode.whileEditing
    textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
}



class SampleScreen : UIViewController {
    
    var titleLabel : UILabel  = {
        let titles = UILabel()
        titles.text = "Add Users"
        titles.translatesAutoresizingMaskIntoConstraints = false
        titles.font = UIFont(name: "Helvetica-Bold", size: 30)
        return titles
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
        view.addSubview(nameTextField)
        view.addSubview(idTF)
        view.addSubview(titleLabel)
        view.addSubview(submit)
        
        setupConstaints()
    }
    
    var idTF: UITextField = {
        let textField = UITextField()
        setupTextField(textField, placeHolder: "Id")
        return textField
    }()
    
    var nameTextField: UITextField = {
       let textField = UITextField()
        setupTextField(textField, placeHolder: "Name")
        return textField
    }()
    
    var submit: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add User", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(addUser), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc fileprivate func addUser() throws {
        do {
            gaurd let   
        }
        catch {
            print(error)
        }
    }
    
    fileprivate func setupConstaints() {
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        idTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        idTF.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        idTF.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: idTF.bottomAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        submit.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        submit.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        submit.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

