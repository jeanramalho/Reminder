//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Jean Ramalho on 01/07/26.
//
import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
