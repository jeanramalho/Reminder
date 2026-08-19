//
//  MyReceiptsView.swift
//  Reminder
//
//  Created by Jean Ramalho on 18/08/26.
//
import Foundation
import UIKit

class MyReceiptsView: UIView {
   // weak public var delegate: MyReceiptsViewDelegate?
    
    let headerBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    let backButton: UIButton = {
        let button =  UIButton()
        let image = UIImage(named: "arrow-left")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = Colors.primaryBlueBase
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minhas Receitas"
        label.font = Typograph.heading
        label.textColor = Colors.primaryBlueBase
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Acompanhe seus medicamentos cadastrados e gerencie seus lembretes"
        label.font = Typograph.body
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
       
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        
        addSubview(headerBackground)
        headerBackground.addSubview(backButton)
        headerBackground.addSubview(titleLabel)
        headerBackground.addSubview(subtitleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -Metrics.small),
            backButton.leadingAnchor.constraint(equalTo: headerBackground.leadingAnchor, constant: Metrics.medium),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor, constant: -Metrics.medium),
            
            
        ])
    }
}
