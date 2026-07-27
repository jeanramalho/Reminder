//
//  HomeViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 22/07/26.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let contentView: HomeView
    let flowDelegate: HomeFlowDelegate
    
    init(contentView: HomeView,
         flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupNavigationBar()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupNavigationBar(){
        let logoutButton = UIBarButtonItem(image: UIImage(named: "log-out-icon"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(logoutAction))
    }
    
    private func setupHierarchy(){
        self.view.addSubview(contentView)
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    @objc
    private func logoutAction(){
        
    }
   
}
