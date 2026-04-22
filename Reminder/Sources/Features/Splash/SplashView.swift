//
//  SplashView.swift
//  Reminder
//
//  Created by Jean Ramalho on 20/04/26.
//
import Foundation
import UIKit

class SplashView: UIView {
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLogoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remind"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .systemRed
        
        setupHierarchy()
        setupConstraints()
        
    }
    
    private func setupHierarchy(){
        addSubview(logoImageView)
        addSubview(titleLogoLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLogoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 24),
            titleLogoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            logoImageView.trailingAnchor.constraint(equalTo: titleLogoLabel.leadingAnchor, constant: -8),
            logoImageView.centerYAnchor.constraint(equalTo: titleLogoLabel.centerYAnchor),
            
                       
        ])
    }
    
    
}
