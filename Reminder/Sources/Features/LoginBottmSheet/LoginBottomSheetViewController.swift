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
        
    }
    
    private func setupGesture(){
        
    }
    
}

