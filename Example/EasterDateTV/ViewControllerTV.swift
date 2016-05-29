//
//  ViewControllerTV.swift
//  EasterDate Example tvOS
//
//  Created by Rufus Cable on 26/05/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import EasterDate

class ViewControllerTV: UIViewController {

    @IBOutlet var westernTitleLabel: UILabel!
    @IBOutlet var orthodoxTitleLabel: UILabel!

    @IBOutlet var westernEasterLabel: UILabel!
    @IBOutlet var orthodoxEasterLabel: UILabel!

    private var year: Int = {
        #if swift(>=3.0)
            return NSCalendar.current().components([.year], from: NSDate()).year
        #else
            return NSCalendar.currentCalendar().components([.Year], fromDate: NSDate()).year
        #endif
    }()
    private var minYear: Int!
    private var maxYear: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        minYear = year - 10
        maxYear = year + 10

        #if swift(>=3.0)
            let leftRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapLeft))
            leftRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.leftArrow.rawValue)]

            let rightRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRight))
            rightRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.rightArrow.rawValue)]
        #else
            let leftRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapLeft(_:)))
            leftRecognizer.allowedPressTypes = [UIPressType.LeftArrow.rawValue]

            let rightRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRight(_:)))
            rightRecognizer.allowedPressTypes = [UIPressType.RightArrow.rawValue]
        #endif
        self.view.addGestureRecognizer(leftRecognizer)
        self.view.addGestureRecognizer(rightRecognizer)


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

    func tapLeft() {
        year = max(minYear, year - 1)
        updateEasterDates()
    }

    func tapRight() {
        year = min(maxYear, year + 1)
        updateEasterDates()
    }
}

