//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 18/08/26.
//
import Foundation
import UIKit

class MyReceiptsViewController: UIViewController {
    let contentView: MyReceiptsView
    
    init(contentView: MyReceiptsView) {
        self.contentView = contentView
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
        view.backgroundColor = Colors.gray600
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        
        view.addSubview(contentView)
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupContentViewToBounds(contentView: contentView)
    }
}
