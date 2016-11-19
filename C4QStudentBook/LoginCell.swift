//
//  LoginCell.swift
//  C4QStudentBook
//
//  Created by Ana Ma on 11/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class LoginCell: BaseCell {
    static let identifier = "LoginCellID"

    //add 2 textview for email and password
    let emailTextField: UITextField = {
       let etf = UITextField()
        etf.backgroundColor = .white
        etf.placeholder = "Please enter email"
        etf.isSecureTextEntry = true
        etf.borderStyle = .roundedRect
        
        etf.translatesAutoresizingMaskIntoConstraints = false
        return etf
    }()
    
    let passwordTextField: UITextField = {
        let ptf = UITextField()
        ptf.backgroundColor = .white
        ptf.placeholder = "Please enter password"
        ptf.isSecureTextEntry = true
        ptf.borderStyle = .roundedRect
        
        ptf.translatesAutoresizingMaskIntoConstraints = false
        return ptf
    }()
    
    lazy var loginButton: UIButton = {
        let lib = UIButton(type: .system)
        lib.setTitle("Login", for: .normal)
        lib.setTitleColor(.white, for: .normal)
        lib.backgroundColor = .orange
        lib.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        lib.translatesAutoresizingMaskIntoConstraints = false
        return lib
    }()
    
    func loginButtonTapped(){
        
    }
    

    override func setupCell() {
        super.setupCell()
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        backgroundColor = .lightGray
        
        emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
