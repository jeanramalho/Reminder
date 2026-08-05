//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 05/08/26.
//
import Foundation
import UIKit


class NewReceiptViewController: UIViewController {
    
    private let contentView: NewReceiptView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.gray800
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(contentView)
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }
}
