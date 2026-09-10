//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Jean Ramalho on 13/08/26.
//
import Foundation

class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
    
    private func scheduleNotification() {
        
    }
    
    private func getIntervalInHours(from recurrence: String) -> Int {
        switch recurrence {
        case "De hora em hora":
            return 1
        case "2 em 2 horas":
            return 2
        case  "4 em 4 horas":
            return 4
        case "6 em 6 horas":
            return 6
        case "8 em 8 horas":
            return 8
        case "12 em 12 horas":
            return 12
        case "1 ao dia":
            return 24
            break
        }
    }
    
    
   
    
    
    
    
}
