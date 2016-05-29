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

    @IBOutlet weak var leftButton: NSButton!
    @IBOutlet weak var rightButton: NSButton!

    private var year: Int!
    private var minYear: Int!
    private var maxYear: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        #if swift(>=3.0)
            year = NSCalendar.current().components([.year], from: NSDate()).year
        #else
            year = NSCalendar.currentCalendar().components([.Year], fromDate: NSDate()).year
        #endif

        minYear = year - 10
        maxYear = year + 10

        updateEasterDates()
    }

    func updateEasterDates() {
        let formatter = NSDateFormatter()
        #if swift(>=3.0)
            formatter.dateStyle = .mediumStyle
            formatter.timeStyle = .noStyle
        #else
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
        #endif

        westernTitleLabel.stringValue = "Western Easter \(year)"

        if let westernEaster = NSDate.westernEasterDateForYear(year) {
            #if swift(>=3.0)
                westernEasterLabel.stringValue = formatter.string(from: westernEaster)
            #else
                westernEasterLabel.stringValue = formatter.stringFromDate(westernEaster)
            #endif
        } else {
            westernEasterLabel.stringValue = "unknown"
        }

        orthodoxTitleLabel.stringValue = "Orthodox Easter \(year)"

        if let orthodoxEaster = NSDate.easternOrthodoxEasterDateForYear(year) {
            #if swift(>=3.0)
                orthodoxEasterLabel.stringValue = formatter.string(from: orthodoxEaster)
            #else
                orthodoxEasterLabel.stringValue = formatter.stringFromDate(orthodoxEaster)
            #endif
        } else {
            orthodoxEasterLabel.stringValue = "unknown"
        }
    }

    @IBAction func buttonClicked(sender: NSButton) {
        switch sender {
        case leftButton:
            year = max(minYear, year - 1)
        case rightButton:
            year = min(maxYear, year + 1)
        default:
            return
        }

        leftButton.isEnabled = year > minYear
        rightButton.isEnabled = year < maxYear

        updateEasterDates()
    }
}

