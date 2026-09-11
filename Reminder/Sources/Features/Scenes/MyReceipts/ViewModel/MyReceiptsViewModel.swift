//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Jean Ramalho on 31/08/26.
//
import Foundation
import UserNotifications

class MyReceiptsViewModel {
    
    func fetchData() -> [Medicine] {
       return DBHelper.shared.fetchReceipts()
    }
    
    func deleteReceipt(byId id: Int) {
        DBHelper.shared.deleteReceipt(byId: id)
      //  removeNotification(for: <#T##String#>)
    }
    
    func removeNotification(for remedy: String) {
        let centerNotification = UNUserNotificationCenter.current()
        let identifiers = (0..<6).map { "\(remedy)-\($0)" }
        centerNotification.removePendingNotificationRequests(withIdentifiers: identifiers)
        print("Notificações removidas para o remédio \(remedy)")
    }
    
}
