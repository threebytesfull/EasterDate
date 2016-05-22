//
//  ViewController.swift
//  EasterDate
//
//  Created by Rufus Cable on 05/22/2016.
//  Copyright (c) 2016 Rufus Cable. All rights reserved.
//

import UIKit
import EasterDate

class ViewController: UIViewController {

    @IBOutlet var westernTitleLabel: UILabel!
    @IBOutlet var orthodoxTitleLabel: UILabel!

    @IBOutlet var westernEasterLabel: UILabel!
    @IBOutlet var orthodoxEasterLabel: UILabel!

    @IBOutlet var stepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()

        let year = NSCalendar.currentCalendar().components([.Year], fromDate: NSDate()).year
        stepper.minimumValue = Double(year - 10)
        stepper.maximumValue = Double(year + 10)
        stepper.value = Double(year)

        updateEasterDates()
    }

    func updateEasterDates() {
        let year = Int(stepper.value)

        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle

        westernTitleLabel.text = "Western Easter \(year)"

        if let westernEaster = NSDate.westernEasterDateForYear(year) {
            westernEasterLabel.text = formatter.stringFromDate(westernEaster)
        } else {
            westernEasterLabel.text = "unknown"
        }

        orthodoxTitleLabel.text = "Orthodox Easter \(year)"

        if let orthodoxEaster = NSDate.easternOrthodoxEasterDateForYear(year) {
            orthodoxEasterLabel.text = formatter.stringFromDate(orthodoxEaster)
        } else {
            orthodoxEasterLabel.text = "unknown"
        }
    }

    @IBAction func stepperValueChanged(sender: AnyObject) {
        updateEasterDates()
    }
}

