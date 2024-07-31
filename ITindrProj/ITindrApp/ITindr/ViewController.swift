//
//  ViewController.swift
//  ITindr
//
//  Created by Tark Wight on 18.07.2024.
//

import UIKit
import ClientAPI

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
//
//import UIKit
//import ClientAPI
//
//class ViewController: UIViewController {
//
//    private let usernameTextField = UITextField()
//    private let passwordTextField = UITextField()
//    private let refreshTokenTextField = UITextField()
//    
//    private let loginButton = UIButton(type: .system)
//    private let registerButton = UIButton(type: .system)
//    private let refreshButton = UIButton(type: .system)
//    private let logoutButton = UIButton(type: .system)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupConstraints()
//    }
//    
//    private func setupUI() {
//        view.backgroundColor = .white
//        
//        // Configure text fields
//        usernameTextField.placeholder = "Username"
//        usernameTextField.borderStyle = .roundedRect
//        usernameTextField.autocapitalizationType = .none
//        usernameTextField.textAlignment = .center
//        
//        passwordTextField.placeholder = "Password"
//        passwordTextField.borderStyle = .roundedRect
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.textAlignment = .center
//        
//        refreshTokenTextField.placeholder = "Refresh Token"
//        refreshTokenTextField.borderStyle = .roundedRect
//        refreshTokenTextField.autocapitalizationType = .none
//        refreshTokenTextField.textAlignment = .center
//
//        // Configure buttons
//        loginButton.setTitle("Login", for: .normal)
//        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//
//        registerButton.setTitle("Register", for: .normal)
//        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
//
//        refreshButton.setTitle("Refresh", for: .normal)
//        refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
//
//        logoutButton.setTitle("Logout", for: .normal)
//        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
//        
//        // Add subviews
//        view.addSubview(usernameTextField)
//        view.addSubview(passwordTextField)
//        view.addSubview(refreshTokenTextField)
//        view.addSubview(loginButton)
//        view.addSubview(registerButton)
//        view.addSubview(refreshButton)
//        view.addSubview(logoutButton)
//    }
//    
//    private func setupConstraints() {
//        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
//        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//        refreshTokenTextField.translatesAutoresizingMaskIntoConstraints = false
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        registerButton.translatesAutoresizingMaskIntoConstraints = false
//        refreshButton.translatesAutoresizingMaskIntoConstraints = false
//        logoutButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
//
//            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
//            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
//            
//            refreshTokenTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            refreshTokenTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
//            refreshTokenTextField.widthAnchor.constraint(equalToConstant: 200),
//            
//            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            loginButton.topAnchor.constraint(equalTo: refreshTokenTextField.bottomAnchor, constant: 20),
//            
//            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
//            
//            refreshButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            refreshButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
//            
//            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            logoutButton.topAnchor.constraint(equalTo: refreshButton.bottomAnchor, constant: 20)
//        ])
//    }
//    
//    @objc private func loginButtonTapped() {
//        guard let username = usernameTextField.text, !username.isEmpty,
//              let password = passwordTextField.text, !password.isEmpty else {
//            print("Please enter both username and password")
//            return
//        }
//        
//        let loginBody = AuthBody(email: username, password: password)
//        AuthAPI.login(body: loginBody) { data, error in
//            if let error = error {
//                print("Login Error: \(error.localizedDescription)")
//            } else if let data = data {
//                print("Login Success: \(data)")
//            }
//        }
//    }
//
//    @objc private func registerButtonTapped() {
//        guard let username = usernameTextField.text, !username.isEmpty,
//              let password = passwordTextField.text, !password.isEmpty else {
//            print("Please enter both username and password")
//            return
//        }
//        
//        let registerBody = AuthBody(email: username, password: password)
//        AuthAPI.register(body: registerBody) { data, error in
//            if let error = error {
//                print("Register Error: \(error.localizedDescription)")
//            } else if let data = data {
//                print("Register Success: \(data)")
//            }
//        }
//    }
//
//    @objc private func refreshButtonTapped() {
//        guard let refreshToken = refreshTokenTextField.text, !refreshToken.isEmpty else {
//            print("Please enter a refresh token")
//            return
//        }
//        
//        let refreshBody = RefreshTokenBody(refreshToken: refreshToken)
//        AuthAPI.refresh(body: refreshBody) { data, error in
//            if let error = error {
//                print("Refresh Error: \(error.localizedDescription)")
//            } else if let data = data {
//                print("Refresh Success: \(data)")
//            }
//        }
//    }
//
//    @objc private func logoutButtonTapped() {
//        AuthAPI.logout { data, error in
//            if let error = error {
//                print("Logout Error: \(error.localizedDescription)")
//            } else {
//                print("Logout Success")
//            }
//        }
//    }
//}
