//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Jean Ramalho on 15/07/26.
//
import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    
    func makeSplashViewController() -> SplashViewController {
        let viewController = SplashViewController(flowDelegate: self)
        return viewController
    }
    
    func makeLoginBottomSheetViewController() -> LoginBottomSheetViewController {
        let viewController = LoginBottomSheetViewController(flowDelegate: self)
        return viewController
    }
    
    
}
