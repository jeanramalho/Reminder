//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 05/08/26.
//
import Foundation
import UIKit
import Lottie


class NewReceiptViewController: UIViewController {
    
    private let contentView: NewReceiptView
    private let viewModel: NewReceiptViewModel
    
    private let successAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "successAnimation")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.isHidden = true
        return animationView
    }()

    
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
        view.addSubview(successAnimationView)
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
        
        NSLayoutConstraint.activate([
            successAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            successAnimationView.heightAnchor.constraint(equalToConstant: 120),
            successAnimationView.widthAnchor.constraint(equalToConstant: 120),
            
        ])
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
        
        contentView.remedyinput.cleanText()
        contentView.timeInput.cleanText()
        contentView.recurrenceInput.cleanText()
        
        playSuccessAnimation()
        print("\(remedy) Adicionado com suceeso!")
    }
    
    private func playSuccessAnimation() {
        successAnimationView.isHidden = false
        successAnimationView.play { [weak self] finished in
            guard let self = self else {return}
            if finished {
                self.successAnimationView.isHidden = true
            }
        }
    }
}
