//
//  TaskModel.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import Foundation
import RealmSwift

class TaskModel: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var day = Date()
    @objc dynamic var startDate = Date()
    @objc dynamic var finishDate = Date()
    @objc dynamic var name: String = "MyTask"
    @objc dynamic var taskDescription: String? = nil
 
    init(id: Int, name: String, _ taskDescription: String?, day: Date, start: Date, finish: Date) {
        
        self.id = id
        self.name = name
        self.taskDescription = taskDescription
        self.day = day
        self.startDate = start
        self.finishDate = finish
    }
    
    required override init() {
        super.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case day
        case startDate = "date_start"
        case finishDate = "date_finish"
        case name
        case taskDescription = "description"
    }
}
