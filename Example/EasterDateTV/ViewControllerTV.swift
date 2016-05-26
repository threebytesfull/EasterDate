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
        return NSCalendar.currentCalendar().components([.Year], fromDate: NSDate()).year
    }()
    private var minYear: Int!
    private var maxYear: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        minYear = year - 10
        maxYear = year + 10

        let leftRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapLeft(_:)))
        leftRecognizer.allowedPressTypes = [UIPressType.LeftArrow.rawValue]
        self.view.addGestureRecognizer(leftRecognizer)

        let rightRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRight(_:)))
        rightRecognizer.allowedPressTypes = [UIPressType.RightArrow.rawValue]
        self.view.addGestureRecognizer(rightRecognizer)

        updateEasterDates()
    }

    func updateEasterDates() {
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

    func tapLeft(recognizer: UITapGestureRecognizer) {
        year = max(minYear, year - 1)
        updateEasterDates()
    }

    func tapRight(recognizer: UITapGestureRecognizer) {
        year = min(maxYear, year + 1)
        updateEasterDates()
    }
}

