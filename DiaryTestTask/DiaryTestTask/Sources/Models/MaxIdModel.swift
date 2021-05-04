//
//  MaxIdModel.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import Foundation
import RealmSwift

class MaxIdModel: Object, Decodable {
    
    @objc dynamic var name: String = "maxId"
    @objc dynamic var counter: Int = 0
    
    init(id: Int) {
        self.counter = id
        self.name = "maxId"
    }
    
    required override init() {
        super.init()
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
