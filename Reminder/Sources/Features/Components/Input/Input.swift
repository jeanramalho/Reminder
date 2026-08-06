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
    
    private let textField = {
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
}
