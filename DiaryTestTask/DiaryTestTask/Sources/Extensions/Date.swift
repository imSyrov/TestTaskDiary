//
//  Date.swift
//  DiaryTestTask
//
//  Created by ilya on 05.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import Foundation

extension Date {
    func toString(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
