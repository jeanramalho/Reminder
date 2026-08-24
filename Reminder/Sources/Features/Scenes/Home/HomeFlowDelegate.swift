//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Jean Ramalho on 22/07/26.
//
import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipes()
    func navigateToMyRecipes()
    func logout()
}
