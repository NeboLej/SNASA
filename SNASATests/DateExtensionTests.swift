//
//  DateExtensionTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class DateExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testToSimpleDateCase1() {
        //GIVEN
        var date = Date(timeIntervalSince1970: 1695751647) // 2023-09-26 21:07:27
        var expectation = "2023-09-26"
        //WHEN
        var actual = date.toSimpleDate()
        
        //THEN
        XCTAssertEqual(actual, expectation)
    }
    
    func testToSimpleDateCase2() {
        //GIVEN
        var date = Date(timeIntervalSince1970: 1043258847) // 2003-01-22 21:07:27
        var expectation = "2003-01-22"
        //WHEN
        var actual = date.toSimpleDate()
        
        //THEN
        XCTAssertEqual(actual, expectation)
    }
    
    func testAddDayPositivDay() {
        //GIVEN
        var date = Date(timeIntervalSince1970: 1043182800) // 2003-01-22 00:00:00
        var expectation = Date(timeIntervalSince1970: 1043442000) // 2003-01-25 00:00:00
        
        //WHEN
        var actual = date.addDay(day: 3)
        
        //THEN
        XCTAssertEqual(actual, expectation)
    }
    
    func testAddDayNegativDay() {
        //GIVEN
        var date = Date(timeIntervalSince1970: 1043182800) // 2003-01-22 00:00:00
        var expectation = Date(timeIntervalSince1970: 1042146000) // 2003-01-10 00:00:00
        
        //WHEN
        var actual = date.addDay(day: -12)
        
        //THEN
        XCTAssertEqual(actual, expectation)
    }
    
    
}
//func addDay(day:Int) -> Date {
//  return Calendar.current.date(byAdding: .day, value: day, to: Date())!
//}
