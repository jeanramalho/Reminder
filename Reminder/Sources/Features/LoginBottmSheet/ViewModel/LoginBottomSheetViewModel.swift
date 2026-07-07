//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Jean Ramalho on 06/07/26.
//
import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {

    func doAuth(userNameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: <#T##String#>, password: <#T##String#>) { [weak self] authResult, error in
            if let error = error {
                print("autenticacao nao foi concluida com sucesso \(error)")
            } else {
                print(authResult, "Sucesso na autenticação")
            }
        }
    }
}
