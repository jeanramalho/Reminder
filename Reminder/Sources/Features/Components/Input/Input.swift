//
//  Input.swift
//  Reminder
//
//  Created by Jean Ramalho on 06/08/26.
//
import Foundation
import UIKit

public class Input: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.label
        label.textColor = Colors.gray100
        return label
    }()
    
    let textField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = Typograph.input
        textField.textColor = Colors.gray100
        textField.borderStyle = .roundedRect
        textField.backgroundColor = Colors.gray800
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.layer.cornerRadius = Metrics.tiny
        return textField
    }()
    
    init(title: String, placeholder: String){
        super.init(frame: .zero)
        setupView()
        
        titleLabel.text = title
        textField.placeholder =  placeholder
        configurePlaceHolder(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        
        addSubview(titleLabel)
        addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 85),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56),
            
        ])
    }
    
    private func configurePlaceHolder(placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.gray200])
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
}
