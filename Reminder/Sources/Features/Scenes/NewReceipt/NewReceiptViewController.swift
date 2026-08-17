//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 05/08/26.
//
import Foundation
import UIKit


class NewReceiptViewController: UIViewController {
    
    private let contentView: NewReceiptView
    private let viewModel: NewReceiptViewModel
    
    init(contentView: NewReceiptView, viewModel: NewReceiptViewModel) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func setupActions() {
        contentView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        contentView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func addButtonTapped() {
        let remedy = contentView.remedyinput.getText()
        let time = contentView.timeInput.getText()
        let recurrence = contentView.recurrenceInput.getText()
        let takeNow = false
        
        viewModel.addReceipt(remedy: remedy,
                             time: time,
                             recurrence: recurrence,
                             takeNow: takeNow)
        
        print("\(remedy) Adicionado com suceeso!")
    }
}
