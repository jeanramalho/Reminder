//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 24/06/26.
//
import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    private let contentView: LoginBottomSheetView = LoginBottomSheetView()
    private var handleAreaHeiht: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        setup()
    }
    
    private func setup() {
        setupHierarchy()
        setupConstraints()
        setupGesture()
    }
    
    private func setupHierarchy() {
        self.view.addSubview(contentView)
    }
    
    private func setupConstraints(){
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    private func setupGesture(){
        
    }
    
    private func handlePanGesture(){
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        print(user)
    }
    
    
}

