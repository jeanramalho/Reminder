//
//  Checkbox.swift
//  Reminder
//
//  Created by Jean Ramalho on 07/08/26.
//
import Foundation
import UIKit

class Checkbox: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.input
        label.textColor = Colors.gray200
        return label
    }()
    
    private let checkbox: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = Colors.gray400
        return button
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        
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
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
}
