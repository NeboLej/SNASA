//
//  main.swift
//  SNASA
//
//  Created by Nebo on 25.09.2023.
//

import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil
let appDelegateClass = isRunningTests ? NSStringFromClass(AppDelegateMock.self) : NSStringFromClass(AppDelegate.self)
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)

class AppDelegateMock: NSObject {} 
