//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 24/06/26.
//
import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    private let contentView: LoginBottomSheetView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        self.view.addSubview(contentView)
    }
    
    private func setupConstraints(){
        
    }
    
}

