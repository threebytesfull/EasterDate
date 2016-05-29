//
//  NSDate+EasterDate.swift
//  Pods
//
//  Created by Rufus Cable on 22/05/2016.
//
//

import Foundation

extension NSDate {
    /// Returns the date of Easter Sunday in the Gregorian calendar
    /// for the specified year.
    #if swift(>=3.0)
    public class func westernEasterDateForYear(_ year: Int) -> NSDate? {
        return self.westernEasterDate(year: year)
    }
    #else
    public class func westernEasterDateForYear(year: Int) -> NSDate? {
        return self.westernEasterDate(year)
    }
    #endif

    public class func westernEasterDate(year: Int) -> NSDate? {
        guard year >= 1583 else {
            // This calculation is valid for the year 1583 and onwards
            return nil
        }

        // Anonymous Gregorian Algorithm
        // https://en.wikipedia.org/wiki/Computus#Anonymous_Gregorian_algorithm
        let a = year % 19
        let b = year / 100
        let c = year % 100
        let d = b / 4
        let e = b % 4
        let f = (b + 8) / 25
        let g = (b - f + 1) / 3
        let h = ((19 * a) + b - d - g + 15) % 30
        let i = c / 4
        let k = c % 4
        let l = (32 + (2 * e) + (2 * i) - h - k) % 7
        let m = (a + (11 * h) + (22 * l)) / 451
        let n = h + l - (7 * m) + 114
        let month = n / 31
        let day = (n % 31) + 1

        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = 12
        components.timeZone = NSTimeZone(forSecondsFromGMT: 0)

        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        #if swift(>=3.0)
            return calendar.date(from: components)
        #else
            return calendar.dateFromComponents(components)
        #endif
    }

    /// Returns the date of Eastern Orthodox Easter in the Julian calendar
    /// for the specified year.
    #if swift(>=3.0)
    public class func easternOrthodoxEasterDateForYear(_ year: Int) -> NSDate? {
        return self.easternOrthodoxEasterDate(year: year)
    }
    #else
    public class func easternOrthodoxEasterDateForYear(year: Int) -> NSDate? {
        return self.easternOrthodoxEasterDate(year)
    }
    #endif

    public class func easternOrthodoxEasterDate(year: Int) -> NSDate? {
        guard (1900...2099).contains(year) else {
            // This calculation is valid for the years 1900-2099 only
            return nil
        }

        // Meeus's Julian Algorithm
        // https://en.wikipedia.org/wiki/Computus#Meeus.27_Julian_algorithm
        let a = year % 4
        let b = year % 7
        let c = year % 19
        let d = (19 * c + 15) % 30
        let e = (2 * a + 4 * b - d + 34) % 7
        let f = d + e + 114
        let month = f / 31
        let day = (f % 31) + 1

        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day + 13
        components.hour = 12
        components.timeZone = NSTimeZone(forSecondsFromGMT: 0)

        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        #if swift(>=3.0)
            return calendar.date(from: components)
        #else
            return calendar.dateFromComponents(components)
        #endif
    }
}
