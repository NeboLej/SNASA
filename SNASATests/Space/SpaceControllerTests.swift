//
//  SpaceControllerTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class SpaceControllerTests: XCTestCase {

    var sut: SpaceController?
    var presenter: SpacePresenterMock?
    
    override func setUp() {
        presenter = SpacePresenterMock()
        sut = SpaceController()
        sut?.presenter = presenter
        super.setUp()
    }
    
    override func tearDown() {
        presenter = nil
        sut = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        //GIVEN
        presenter?.isViewDidLoaded = false
        
        //WHEN
        sut?.viewDidLoad()
        
        //THEN
        XCTAssertEqual(presenter?.isViewDidLoaded, true)
    }

}
