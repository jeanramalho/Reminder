//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Jean Ramalho on 13/08/26.
//
import Foundation
import UserNotifications

class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
        scheduleNotification(remedy: remedy, time: time, recurrence: recurrence)
    }
    
    private func scheduleNotification(remedy: String, time: String, recurrence: String) {
        let centerNotification = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Hora de tomar o remédio"
        content.body = "É hora de tomar o remédio \(remedy)"
        content.sound = .default
        
        guard let interval = getIntervalInHours(from: recurrence) else {return}
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        guard let initialDate = formatter.date(from: time) else {return}
        
        let calendar = Calendar.current
        var currentDate = initialDate
        
        for i in 00..<(24 / interval) {
            let components = calendar.dateComponents([.hour, .minute], from: currentDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            
            let request = UNNotificationRequest(identifier: "\(remedy)-\(i)",
                                                content: content,
                                                trigger: trigger)
            
            
            centerNotification.add(request) { error  in
                if let error = error {
                    print("Erro ao agendar notificação: \(error.localizedDescription)")
                } else {
                    print("Notificação agendada com sucesso para \(remedy) às \(time) com recorrência \(recurrence)")
                }
            }
            currentDate = calendar.date(byAdding: .hour, value: interval, to: currentDate)
        }
    }
    
    private func getIntervalInHours(from recurrence: String) -> Int? {
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
        default:
            return nil
        }
    }
    
}
