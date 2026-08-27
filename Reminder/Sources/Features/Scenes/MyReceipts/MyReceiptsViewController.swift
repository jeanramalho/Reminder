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
    weak var flowDelegate: MyReceiptsFlowDelegate?
    
    private let mockMedicamentos = [
        ("buscopam, 13:00", "2 em 2 horas"),
        ("lorazepam, 15:00", "4 em 4 horas"),
        ("venlift, 17:00", "6 em 6 horas"),
        ("depakote, 20:00", "1 vez ao dia"),
        ("closapina, 22:00", "8 em 8 horas"),
        ("litum, 4:00", "2 em 2 horas"),
        
    ]
    
    init(contentView: MyReceiptsView, flowDelegate: MyReceiptsFlowDelegate) {
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
