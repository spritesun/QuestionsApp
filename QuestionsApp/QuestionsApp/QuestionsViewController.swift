//
//  QuestionsViewController.swift
//  QuestionsApp
//
//  Created by Long Sun on 25/03/2015.
//  Copyright (c) 2015 Sunlong. All rights reserved.
//

import UIKit

class QuestionsViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerView: UIPickerView!
    var questions: [Question?]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = [
            Question(floor: 3, ceiling: 5),
            nil,
            Question(floor: 10, ceiling: 15),
            Question(floor: 3, ceiling: 10),
            Question(floor: 5, ceiling: 20)]
    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        pickerView = (parentViewController as ViewController).pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        pickerView.hidden = (questions[indexPath.row] == nil)
        pickerView.reloadAllComponents()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let question  = selectedQuestion() {
            return question.answerCount()
        }
        return 0
    }
    
    func selectedQuestion() -> Question? {
        if let indexPath = tableView.indexPathForSelectedRow() {
            return questions[indexPath.row]
        }
        return nil
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if let question  = selectedQuestion() {
            return String(question.floor + row)
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let indexPath = tableView.indexPathForSelectedRow() {
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
            selectedCell?.detailTextLabel?.text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
        }
    }
}
