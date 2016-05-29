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

        #if swift(>=3.0)
            let year = NSCalendar.current().components([.year], from: NSDate()).year
        #else
            let year = NSCalendar.currentCalendar().components([.Year], fromDate: NSDate()).year
        #endif
        stepper.minimumValue = Double(year - 10)
        stepper.maximumValue = Double(year + 10)
        stepper.value = Double(year)

        updateEasterDates()
    }

    func updateEasterDates() {
        let year = Int(stepper.value)

        let formatter = NSDateFormatter()
        #if swift(>=3.0)
            formatter.dateStyle = .mediumStyle
            formatter.timeStyle = .noStyle
        #else
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
        #endif

        westernTitleLabel.text = "Western Easter \(year)"

        if let westernEaster = NSDate.westernEasterDateForYear(year) {
            #if swift(>=3.0)
                westernEasterLabel.text = formatter.string(from: westernEaster)
            #else
                westernEasterLabel.text = formatter.stringFromDate(westernEaster)
            #endif
        } else {
            westernEasterLabel.text = "unknown"
        }

        orthodoxTitleLabel.text = "Orthodox Easter \(year)"

        if let orthodoxEaster = NSDate.easternOrthodoxEasterDateForYear(year) {
            #if swift(>=3.0)
                orthodoxEasterLabel.text = formatter.string(from: orthodoxEaster)
            #else
                orthodoxEasterLabel.text = formatter.stringFromDate(orthodoxEaster)
            #endif
        } else {
            orthodoxEasterLabel.text = "unknown"
        }
    }

    #if swift(>=3.0)
    @IBAction func stepperValueChanged(sender: UIStepper) {
        updateEasterDates()
    }
    #else
    @IBAction func stepperValueChangedWithSender(sender: AnyObject) {
        updateEasterDates()
    }
    #endif
}

