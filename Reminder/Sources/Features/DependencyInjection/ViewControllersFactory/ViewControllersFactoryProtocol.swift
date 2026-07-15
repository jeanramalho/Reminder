//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Jean Ramalho on 15/07/26.
//
import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController() -> SplashViewController
    func makeLoginBottomSheetViewController() -> LoginBottomSheetViewController
}
