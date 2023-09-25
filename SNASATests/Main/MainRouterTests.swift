//
//  MainRouterTests.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import XCTest
@testable import SNASA

final class MainRouterTests: XCTestCase {

    var sut: MainRouter?
    var controller: MainControllerMock?
    
    override func setUp() {
        sut = MainRouter()
        controller = MainControllerMock()
        sut?.viewController = controller
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        controller = nil
        super.tearDown()
    }
    
    func testOpenSpace() {
        //GIVEN
        controller?.isPresentSpaceController = false
        
        //WHEN
        sut?.openSpace(date: "Test")
        
        //THEN
        XCTAssertEqual(controller?.isPresentSpaceController, true)
    }
}
