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

    func doAuth(userNameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                print("autenticacao nao foi concluida com sucesso \(error)")
            } else {
                self?.succesResult?(userNameLogin)
            }
        }
    }
}
