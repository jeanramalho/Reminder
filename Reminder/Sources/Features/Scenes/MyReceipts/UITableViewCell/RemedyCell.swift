//
//  RemedyCell.swift
//  Reminder
//
//  Created by Jean Ramalho on 25/08/26.
//
import Foundation
import UIKit

class RemedyCell: UITableViewCell {
    
    static let identifier = "RemedyCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.subHeading
        label.textColor = Colors.gray200
        return label
    }()
    
    private let timeBackgroundView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.tag
        label.textColor = Colors.gray100
        return label
    }()
}
