//
//  AlarmViewController.swift
//  QuestionsApp
//
//  Created by Long Sun on 26/03/2015.
//  Copyright (c) 2015 Sunlong. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var datePicker: UIDatePicker!
    
    var titles = ["Please choose your timezone", "1.", "2.", "3."]
    var values = ["CST", "10:30 AM","3:30 PM","8:30 PM"]
    var pickerOptions = ["CST", "HST", "AKST", "PST"]
    var dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("alarmCell") as? UITableViewCell
        cell?.textLabel?.text = titles[indexPath.row]
        cell?.detailTextLabel?.text = values[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            pickerView.hidden = false
            datePicker.hidden = true
        case 1, 2, 3:
            pickerView.hidden = true
            datePicker.hidden = false
        default:
            pickerView.hidden = true
            datePicker.hidden = true
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
        cell?.detailTextLabel?.text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
    }
    
    @IBAction func dateValueChanged(sender: AnyObject) {
        if let indexPath = tableView.indexPathForSelectedRow() {
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
            selectedCell?.detailTextLabel?.text = dateFormatter.stringFromDate(datePicker.date)
        }
    }
}
