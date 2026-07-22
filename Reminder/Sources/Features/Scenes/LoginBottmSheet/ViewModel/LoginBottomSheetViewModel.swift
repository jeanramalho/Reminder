//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Jean Ramalho on 06/07/26.
//
import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    
    var succesResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?

    func doAuth(userNameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorResult?("Erro ao realizar login")
            } else {
                self?.succesResult?(userNameLogin)
            }
        }
    }
}
