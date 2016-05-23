//
//  ViewControllerMac.swift
//  EasterDate_Example_Mac
//
//  Created by Rufus Cable on 23/05/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Cocoa
import EasterDate

class ViewControllerMac: NSViewController {

    @IBOutlet var westernTitleLabel: NSTextField!
    @IBOutlet var orthodoxTitleLabel: NSTextField!

    @IBOutlet var westernEasterLabel: NSTextField!
    @IBOutlet var orthodoxEasterLabel: NSTextField!

    @IBOutlet var stepper: NSStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let year = NSCalendar.currentCalendar().components([.Year], fromDate: NSDate()).year
        stepper.minValue = Double(year - 10)
        stepper.maxValue = Double(year + 10)
        stepper.integerValue = year

        updateEasterDates()
    }

    func updateEasterDates() {
        let year = stepper.integerValue

        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle

        westernTitleLabel.stringValue = "Western Easter \(year)"

        if let westernEaster = NSDate.westernEasterDateForYear(year) {
            westernEasterLabel.stringValue = formatter.stringFromDate(westernEaster)
        } else {
            westernEasterLabel.stringValue = "unknown"
        }

        orthodoxTitleLabel.stringValue = "Orthodox Easter \(year)"

        if let orthodoxEaster = NSDate.easternOrthodoxEasterDateForYear(year) {
            orthodoxEasterLabel.stringValue = formatter.stringFromDate(orthodoxEaster)
        } else {
            orthodoxEasterLabel.stringValue = "unknown"
        }
    }

    @IBAction func stepperValueChanged(sender: AnyObject) {
        updateEasterDates()
    }

}

