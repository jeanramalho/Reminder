//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Jean Ramalho on 14/07/26.
//
import Foundation


public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func splashNavigateToHome()
}
