//
//  SplashView.swift
//  Reminder
//
//  Created by Jean Ramalho on 20/04/26.
//
import Foundation
import UIKit

class SplashView: UIView {
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        setupHierarchy()
        setupConstraints()
        
    }
    
    private func setupHierarchy(){
        addSubview(logoImageView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Metrics.medium),
            
                       
        ])
    }
    
    
}
