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
    
    private let recurrenceBackgreounView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let recurrenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typograph.tag
        label.textColor = Colors.gray100
        return label
    }()
    
    private let watchIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "watch"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    private let recurrenceIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "repeat"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "trash")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = Colors.gray700
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeBackgroundView)
        contentView.addSubview(recurrenceBackgreounView)
        contentView.addSubview(trashButton)
       
        timeBackgroundView.addSubview(watchIcon)
        timeBackgroundView.addSubview(timeLabel)
        
        recurrenceBackgreounView.addSubview(recurrenceIcon)
        recurrenceBackgreounView.addSubview(recurrenceLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.medier),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.medium),
            
            timeBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.small),
            timeBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.medium),
            timeBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            
            watchIcon.leadingAnchor.constraint(equalTo: timeBackgroundView.leadingAnchor, constant: Metrics.small),
            watchIcon.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            watchIcon.heightAnchor.constraint(equalToConstant: 16),
            watchIcon.widthAnchor.constraint(equalToConstant: 16),
            
            timeLabel.leadingAnchor.constraint(equalTo: watchIcon.trailingAnchor, constant: Metrics.tiny),
            timeLabel.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: -Metrics.small),
            
            recurrenceBackgreounView.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            recurrenceBackgreounView.leadingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: Metrics.tiny),
            recurrenceBackgreounView.heightAnchor.constraint(equalToConstant: 28),
            
            recurrenceIcon.leadingAnchor.constraint(equalTo: recurrenceBackgreounView.leadingAnchor, constant: Metrics.small),
            recurrenceIcon.centerYAnchor.constraint(equalTo: recurrenceBackgreounView.centerYAnchor),
            recurrenceIcon.heightAnchor.constraint(equalToConstant: 16),
            recurrenceIcon.widthAnchor.constraint(equalToConstant: 16),
            
            recurrenceLabel.leadingAnchor.constraint(equalTo: recurrenceIcon.trailingAnchor, constant: Metrics.tiny),
            recurrenceLabel.centerYAnchor.constraint(equalTo: recurrenceBackgreounView.centerYAnchor),
            recurrenceLabel.trailingAnchor.constraint(equalTo: recurrenceBackgreounView.trailingAnchor, constant: -Metrics.small),
            
            trashButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.medium),
            trashButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            trashButton.heightAnchor.constraint(equalToConstant: 16),
            trashButton.widthAnchor.constraint(equalToConstant: 16),
            
            contentView.bottomAnchor.constraint(equalTo: timeBackgroundView.bottomAnchor, constant: Metrics.medium),
            
        ])
    }
    
    func configureCell(title: String, time: String, recurrence: String) {
        titleLabel.text = title
        timeLabel.text = time
        recurrenceLabel.text = recurrence
    }
}
