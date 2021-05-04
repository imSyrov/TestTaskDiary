//
//  CreateTaskController.swift
//  DiaryTestTask
//
//  Created by ilya on 05.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import UIKit

class CreateTaskController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var finishDatePicker: UIDatePicker!
    
    let calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createTask() {
        
        var id: Int
        guard let name = self.taskNameTextField.text else {
            showAlert(message: "Sorry! Can't created task, because Task name is empty")
            return
        }
        let description = self.taskDescriptionTextView.text
        var start = self.startDatePicker.date
        var finish = self.finishDatePicker.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH"
        formatter.locale = NSLocale.current
        start = formatter.date(from: formatter.string(from: start)) ?? start
        finish = formatter.date(from: formatter.string(from: finish)) ?? finish
        
        let day = self.calendar.date(byAdding: .day, value: 0, to: self.calendar.startOfDay(for: start)) ?? start
        
        let objects: [MaxIdModel] = DatabaseService.database.readByName(filter: "name == 'maxId'")
        id = objects.first?.counter ?? 0
        
        let newTask = TaskModel(id: id+1, name: name, description, day: day, start: start, finish: finish)
        let newMaxId = MaxIdModel(id: id+1)
        DatabaseService.database.add(objects: [newMaxId])
        DatabaseService.database.add(objects: [newTask])
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func createTask(_ sender: UIButton) {
        createTask()
        self.navigationController?.popViewController(animated: true)
    }
    
}
