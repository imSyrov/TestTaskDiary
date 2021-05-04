//
//  TaskMoreInfoController.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import UIKit

class TaskMoreInfoController: UIViewController {

    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var startTaskLabel: UILabel!
    @IBOutlet weak var finishTaskLabel: UILabel!
    
    
    var taskInfo: TaskModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInformation()
    }
    
    func setInformation () {
        
        self.taskNameLabel.text = taskInfo?.name ?? "Task name"
        self.descriptionTextView.text = taskInfo?.taskDescription ?? ""
        self.startTaskLabel.text = "Start task: " + (taskInfo?.startDate.toString(with: "dd:MM:YYYY HH:mm") ?? Date().toString(with: "dd:MM:YYYY HH:mm"))
        self.finishTaskLabel.text = "Finish task: " + (taskInfo?.finishDate.toString(with: "dd:MM:YYYY HH:mm") ?? Date().toString(with: "dd:MM:YYYY HH:mm"))
    }    
    
    @IBAction func returnToMainController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
