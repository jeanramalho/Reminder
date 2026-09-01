//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Jean Ramalho on 31/08/26.
//
import Foundation

class MyReceiptsViewModel {
    
    func fetchData() -> [Medicine] {
       return DBHelper.shared.fetchReceipts()
    }
    
    func deleteReceipt(byId id: Int) {
        DBHelper.shared.deleteReceipt(byId: id)
    }
}
