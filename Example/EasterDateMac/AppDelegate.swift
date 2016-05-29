//
//  AppDelegate.swift
//  EasterDate_Example_Mac
//
//  Created by Rufus Cable on 23/05/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    #if swift(>=3.0)
    func applicationShouldTerminate(afterLastWindowClosed sender: NSApplication) -> Bool {
        return true
    }
    #else
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    #endif

}

