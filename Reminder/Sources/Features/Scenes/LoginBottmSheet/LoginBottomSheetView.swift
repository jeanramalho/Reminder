//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Jean Ramalho on 24/06/26.
//
import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let handleArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "login.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typograph.subHeading
        return label
    }()
    
    private let loginTextFieldLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "login.loginText.label.title".localized
        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "login.email.placeholder".localized
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "login.passwordText.label.title".localized
        return label
    }()

    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "login.password.placeholder".localized
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.tintColor = .white
        button.titleLabel?.font = Typograph.subHeading
        button.setTitle("login.button.title".localized, for: .normal)
        button.addTarget(self, action: #selector(loginButtomIsTappde), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        setupHierachy()
        setupConstraints()
    }
    
    private func setupHierachy(){
        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(loginTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFieldLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            loginTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            loginTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: loginTextFieldLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
        
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            
        ])
    }
    
    @objc
    private func loginButtomIsTappde(){
        guard let password = passwordTextField.text else {return}
        guard let user = emailTextField.text else {return}
        delegate?.sendLoginData(user: user, password: password)
    }
}
