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
    }
}
