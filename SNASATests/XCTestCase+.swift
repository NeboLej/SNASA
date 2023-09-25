//
//  XCTestCase+.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import Foundation
import XCTest

extension XCTestCase {

  func wait(milliseconds delay: Int) {
    let waitExpectation = expectation(description: "Waiting")
      
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delay)) {
      waitExpectation.fulfill()
    }

    // We use a buffer here to avoid flakiness with Timer on CI
    waitForExpectations(timeout: Double(delay * 1000) + 0.5)
  }
}
