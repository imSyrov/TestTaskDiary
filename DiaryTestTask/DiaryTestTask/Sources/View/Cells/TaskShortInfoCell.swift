//
//  TaskShortInfoCell.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import UIKit

class TaskShortInfoCell: UITableViewCell {

    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    func configure(index: Int, task: TaskModel?) {
            
            self.hourLabel.text = setHour(index: index)
            self.taskNameLabel.text = getTaskName(for: task)
            
        }
        
        private func setHour(index: Int) -> String? {
            
            return "\(index):00-\(index+1):00"
        }
        
        private func getTaskName(for task: TaskModel?) -> String {
            guard let task = task else { return "" }
            
            return task.name
        }
        
    }
