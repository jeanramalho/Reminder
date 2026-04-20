//
//  SplashView.swift
//  Reminder
//
//  Created by Jean Ramalho on 20/04/26.
//
import Foundation
import UIKit

class SplashView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        setupConstraints()
    }
    
    private func setupConstraints(){
        
    }
    
    
}
