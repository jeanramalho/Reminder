//
//  DBHelper.swift
//  Reminder
//
//  Created by Jean Ramalho on 11/08/26.
//
import Foundation
import SQLite3

class DBHelper {
    
    static let shared = DBHelper()
    private var db: OpaquePointer?
    
    private init () {
        openDatabase()
        createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Reminder.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Erro ao abrir banco de dados")
        }
    }
    
    
}
