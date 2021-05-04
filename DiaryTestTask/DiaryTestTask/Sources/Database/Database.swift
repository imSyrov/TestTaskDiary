//
//  Database.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseService {
    let calendar = Calendar.current
    static var database: DatabaseService = DatabaseService()
    let realm: Realm
    private static var documentDirectoryURL: URL = {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }()
    
    private init() {
        let fileURL = DatabaseService.documentDirectoryURL.appendingPathComponent("database", isDirectory: false)
        let configuration = Realm.Configuration(fileURL: fileURL, schemaVersion: 5)
        realm = try! Realm(configuration: configuration)
    }
    
    func add<T: Object>(objects: [T]) {
        try! self.realm.write({
            realm.add(objects, update: .all)
        })
    }
    
    func readByName<T: Object>(filter: String? = nil) -> [T] {
        
        guard let filter = filter else { return Array(self.realm.objects(T.self).map({ $0 })) }
        let objects = self.realm.objects(T.self).filter(filter)
        
        return Array(objects.map({ $0 }))
    }
    
    func readByDate<T: Object>(filter: String? = nil ,date: Date? = nil) -> [T] {
        
        guard let date = date, let filter = filter else { return Array(self.realm.objects(T.self).map({ $0 })) }
        let dateFilter = self.calendar.date(byAdding: .day, value: 0, to: self.calendar.startOfDay(for: date)) ?? date
        let objects = self.realm.objects(T.self).filter(filter + " == %@", dateFilter)
        
        return Array(objects.map({ $0 }))
    }
    
    func clearData() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
