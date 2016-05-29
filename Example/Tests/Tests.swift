import EasterDate
import XCTest

import Foundation

class EasterDateTests: XCTestCase {

    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

    func testWesternEasterBeforeGregorianCalendar() {
        for year in [1000, 1500, 1582] {
            let easter = NSDate.westernEasterDateForYear(year)
            XCTAssertNil(easter)
        }
    }

    func testWesternEasterForGregorianCalendar() {
        let gregorianEasterDates = [
                                       1583: [1583, 4, 10],
                                       2015: [2015, 4, 5],
                                       2016: [2016, 3, 27],
                                       2017: [2017, 4, 16],
        ]
        gregorianEasterDates.forEach { year, expectedEaster in
            let easter = NSDate.westernEasterDateForYear(year)
            XCTAssertNotNil(easter)
            if let easter = easter {
                #if swift(>=3.0)
                    let components = calendar.components([.year, .month, .day], from: easter)
                #else
                    let components = calendar.components([.Year, .Month, .Day], fromDate: easter)
                #endif
                XCTAssertEqual([components.year, components.month, components.day], expectedEaster)
            }
        }
    }

    func testOrthodoxEasterBefore1900() {
        for year in [1000, 1500, 1583, 1899] {
            let easter = NSDate.easternOrthodoxEasterDateForYear(year)
            XCTAssertNil(easter)
        }
    }

    func testOrthodoxEasterBetween1900And2099() {
        let orthodoxEasterDates = [
                                     2008: [2008, 4, 27],
                                     2009: [2009, 4, 19],
                                     2010: [2010, 4, 4],
                                     2011: [2011, 4, 24],
                                     2016: [2016, 5, 1],
        ]
        orthodoxEasterDates.forEach { year, expectedEaster in
            let easter = NSDate.easternOrthodoxEasterDateForYear(year)
            XCTAssertNotNil(easter)
            if let easter = easter {
                #if swift(>=3.0)
                    let components = calendar.components([.year, .month, .day], from: easter)
                #else
                    let components = calendar.components([.Year, .Month, .Day], fromDate: easter)
                #endif
                XCTAssertEqual([components.year, components.month, components.day], expectedEaster)
            }
        }
    }

    func testOrthodoxEasterAfter2099() {
        for year in [2100, 2200] {
            let easter = NSDate.easternOrthodoxEasterDateForYear(year)
            XCTAssertNil(easter)
        }
    }
}
