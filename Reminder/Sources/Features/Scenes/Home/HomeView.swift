//
//  HomeView.swift
//  Reminder
//
//  Created by Jean Ramalho on 22/07/26.
//
import Foundation
import UIKit

class HomeView: UIView {
    
    let profileBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 35
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boas Vindas"
        label.textColor = .black
        label.font = Typograph.input
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.subHeading
        label.textColor = .black
        return label
    }()
    
    let feeebackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Avaliar", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        
        addSubview(profileBackground)
        profileBackground.addSubview(profileImage)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameLabel)
        
        addSubview(contentBackground)
        contentBackground.addSubview(feeebackButton)
    }
    
    private func setupConstraints() {
        
    }
}
