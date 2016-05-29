# EasterDate

[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CI Status](http://img.shields.io/travis/threebytesfull/EasterDate.svg?style=flat)](https://travis-ci.org/threebytesfull/EasterDate)
[![Version](https://img.shields.io/cocoapods/v/EasterDate.svg?style=flat)](http://cocoapods.org/pods/EasterDate)
[![License](https://img.shields.io/cocoapods/l/EasterDate.svg?style=flat)](http://cocoapods.org/pods/EasterDate)
[![Platform](https://img.shields.io/cocoapods/p/EasterDate.svg?style=flat)](http://cocoapods.org/pods/EasterDate)

## Usage

#### Western Easter

To calculate the date of Western Easter for a given year:

```swift
let easter = NSDate.westernEasterDate(2016)
// easter is an NSDate
```

To calculate the date of Eastern Orthodox Easter for a given year:

```swift
let easter = NSDate.easternOrthodoxEasterDate(2016)
// easter is an NSDate
```

Note that while the calculation for Eastern Orthodox Easter is based on the
Julian calendar, the date returned is in the Gregorian calendar.

## Example

To run the example project, clone the repo, and run `pod install` from the
Example directory first. There are example targets for iOS, OS X and tvOS.

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

[Anonymous Gregorian Algorithm](https://en.wikipedia.org/wiki/Computus#Anonymous_Gregorian_algorithm)
[Meeus's Julian Algorithm](https://en.wikipedia.org/wiki/Computus#Meeus.27_Julian_algorithm)

## License

EasterDate is available under the MIT license. See the LICENSE file for more info.
