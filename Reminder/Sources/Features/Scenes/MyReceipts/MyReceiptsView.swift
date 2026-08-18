//
//  MyReceiptsView.swift
//  Reminder
//
//  Created by Jean Ramalho on 18/08/26.
//
import Foundation
import UIKit

class MyReceiptsView: UIView {
   // weak public var delegate: MyReceiptsViewDelegate?
    
    let headerBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        
    }
}
