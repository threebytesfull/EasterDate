# EasterDate

[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CI Status](http://img.shields.io/travis/threebytesfull/EasterDate.svg?style=flat)](https://travis-ci.org/threebytesfull/EasterDate)
[![Version](https://img.shields.io/cocoapods/v/EasterDate.svg?style=flat)](http://cocoapods.org/pods/EasterDate)
[![License](https://img.shields.io/cocoapods/l/EasterDate.svg?style=flat)](http://cocoapods.org/pods/EasterDate)
[![Platform](https://img.shields.io/cocoapods/p/EasterDate.svg?style=flat)](http://cocoapods.org/pods/EasterDate)

## Introduction

This module adds Easter date calculation class methods to `NSDate`. It's
written in [Swift](https://swift.org) and runs on various platforms:

* Swift 2.2 on iOS, tvOS, Mac OS X, Linux
* Swift 3.0 on iOS, tvOS, Mac OS X, Linux

It can be installed with [CocoaPods](https://cocoapods.org) or [Swift Package
Manager](https://swift.org/package-manager/).

## Usage

#### Western Easter

To calculate the date of Western Easter for a given year:

```swift
import EasterDate

let easter = NSDate.westernEasterDate(2016)
// easter is an NSDate
```

To calculate the date of Eastern Orthodox Easter for a given year:

```swift
import EasterDate

let easter = NSDate.easternOrthodoxEasterDate(2016)
// easter is an NSDate
```

Note that while the calculation for Eastern Orthodox Easter is based on the
Julian calendar, the date returned is in the Gregorian calendar.

To calculate Western Easter Sunday for this year:

```swift
// Get current year (Swift 2.2)
let year = NSCalendar.currentCalendar().components([.Year], fromDate: NSDate()).year

// Get current year (Swift 3.0)
let year = NSCalendar.current().components([.year], from: NSDate()).year

// Get current year (Swift 3.0, Linux)
let year = NSCalendar.current().components([.year], from: NSDate())!.year

// Get Easter for year
let easter = NSDate.westernEasterDate(year: year)
```

## Examples

The included example project provides build targets for three platforms: iOS,
tvOS and Mac OS X. Each provides a very simple interface to view the Western
and Eastern Orthodox dates for Easter Sunday for a selected year, along with
a method of selecting years. There's nothing complex or exciting in these
examples - they're more to demonstrate that the build environment works
properly!

To run them, you'll need to clone the Git repository and refresh the CocoaPods:

```bash
# Clone the repository
git clone https://github.com/threebytesfull/EasterDate.git

# cd into the Example directory
cd EasterDate/Example

# Refresh the CocoaPods
pod install
```

Open the `\.xcworkspace` file in the Example directory and you can build any of
the supplied example targets.

## Linux

The project includes a shell script, `test-linux.bash` which uses
[Docker](https://www.docker.com) to start up a Linux environment with
a development snapshot of Swift 3.0 and run the EasterDate unit tests.

## Requirements

This module supports Swift 2.2 and Swift 3.0 (tested so far with the
2016-05-09-a development snapshot) on OS X, iOS, tvOS and Linux.

## Installation

EasterDate is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EasterDate"
```

## Author

Rufus Cable, rufus@threebytesfull.com

## Credits

The date calculation algorithms are not mine. Both come from Wikipedia:

* [Anonymous Gregorian Algorithm](https://en.wikipedia.org/wiki/Computus#Anonymous_Gregorian_algorithm)
* [Meeus's Julian Algorithm](https://en.wikipedia.org/wiki/Computus#Meeus.27_Julian_algorithm)

## License

EasterDate is available under the MIT license. See the LICENSE file for more info.
