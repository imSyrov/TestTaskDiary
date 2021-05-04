//
//  MainController.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import Foundation
import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var calendarDatePicker: UIDatePicker!
    @IBOutlet weak var hoursTable: UITableView!
    
    let calendar = Calendar.current
    private let hoursInDay: Int = 24
    private var currentDate = Date()
    private var startDay = Date()
    
    private var tasks: [TaskModel] = [] {
        didSet {
            hoursTable.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentDate = self.calendar.date(byAdding: .day, value: 0, to: self.calendar.startOfDay(for: self.calendarDatePicker.date)) ?? self.calendarDatePicker.date
    }
    
    private func findTask(index: Int) -> TaskModel? {
        var result: TaskModel? = nil
        let start = currentDate.addingTimeInterval(TimeInterval(index*3600))
        let end = currentDate.addingTimeInterval(TimeInterval((index+1)*3600))
                
        for task in tasks {
            
            if task.startDate <= start && task.finishDate >= end {
                result = task
                break
            }
        }
        
        return result
    }    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func currentDateChange(_ sender: UIDatePicker) {
        
    }
}

extension MainController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hoursInDay
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskShortInfoCell = hoursTable.dequeueReusableCell(for: indexPath)
        cell.configure(index: indexPath.row, task: findTask(index: indexPath.row))
        return cell
    }
    
}

extension MainController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        hoursTable.deselectRow(at: indexPath, animated: true)
    }
}
