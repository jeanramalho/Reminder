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
}
