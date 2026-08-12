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
    
    private func createTable() {
        let createTablerQuery = """
            CREATE TABLE IF NOT EXISTS receipts (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                remedy TEXT,
                time TEXT,
                recurrence TEXT,
                takeNow INTEGER
            );
            """
        
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTablerQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Tabela criada com sucesso")
            } else {
                print("Erro na criação da tabela")
            }
        } else {
            print("CreateTable statement nao conseguiu executar")
        }
        sqlite3_finalize(statement)
    }
    
    func insertReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        
        let insertQuery = "INSERT INTO Receipts (remedy, time, recurrence, takeNow) VALUES (?, ?, ?, ?);"
    }
    
}
