// https://github.com/Quick/Quick

import Quick
import Nimble
import EasterDate

import Foundation

class EasterDateSpec: QuickSpec {
    override func spec() {
        describe("Easter calculation") {

            let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

            context("Western Easter") {

                context("before Gregorian calendar") {
                    for year in [1000, 1500, 1582] {
                        it("should not return date for Easter \(year)") {
                            let easter = NSDate.westernEasterDateForYear(year)
                            expect(easter).to(beNil())
                        }
                    }
                }

                context("after Gregorian calendar") {

                    let gregorianEasterDates = [
                        1583: [1583, 4, 10],
                        2015: [2015, 4, 5],
                        2016: [2016, 3, 27],
                        2017: [2017, 4, 16],
                        ]

                    gregorianEasterDates.forEach { year, expectedEaster in
                        it("calculates correct date for Easter \(year)") {
                            let easter = NSDate.westernEasterDateForYear(year)
                            expect(easter).notTo(beNil())
                            if let easter = easter {
                                let components = calendar.components([.Year, .Month, .Day], fromDate: easter)
                                expect([components.year, components.month, components.day]).to(equal(expectedEaster))
                            }
                        }
                    }
                }
            }

            context("Eastern Orthodox Easter") {

                context("before 1900") {
                    for year in [1000, 1500, 1583, 1899] {
                        it("should not return date for Easter \(year)") {
                            let easter = NSDate.easternOrthodoxEasterDateForYear(year)
                            expect(easter).to(beNil())
                        }
                    }
                }

                context("between 1900 and 2099") {

                    let orthodoxEasterDates = [
                        2008: [2008, 4, 27],
                        2009: [2009, 4, 19],
                        2010: [2010, 4, 4],
                        2011: [2011, 4, 24],
                        2016: [2016, 5, 1],
                    ]

                    orthodoxEasterDates.forEach { year, expectedEaster in
                        it("calculates correct date for Easter \(year)") {
                            let easter = NSDate.easternOrthodoxEasterDateForYear(year)
                            expect(easter).notTo(beNil())
                            if let easter = easter {
                                let components = calendar.components([.Year, .Month, .Day], fromDate: easter)
                                expect([components.year, components.month, components.day]).to(equal(expectedEaster))
                            }
                        }
                    }
                }

                context("after 2099") {
                    for year in [2100, 2200] {
                        it("should not return date for Easter \(year)") {
                            let easter = NSDate.easternOrthodoxEasterDateForYear(year)
                            expect(easter).to(beNil())
                        }
                    }
                }
            }
        }
    }
}
