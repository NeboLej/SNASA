//
//  SpaceInteractorTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class SpaceInteractorTests: XCTestCase {

    var sut: SpaceInteractor?
    var presenter: SpacePresenterMock?
    var spaceService: SpaceServiceMock?
    var spaceDate = "2000-01-01"
    
    override func setUp() {
        presenter = SpacePresenterMock()
        sut = SpaceInteractor(spaceDate: spaceDate)
        spaceService = SpaceServiceMock()
        sut?.presenter = presenter
        sut?.spaceSrvice = spaceService!
        super.setUp()
    }
    
    override func tearDown() {
        presenter = nil
        spaceService = nil
        sut = nil
        super.tearDown()
    }
    
    func testloadSpaceByDateSuccess() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: spaceDate, explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceService?.spaces.insert(expectationEntity)
        presenter?.spaceDate = nil
        
        //WHEN
        sut?.loadSpace()
        
        //THEN
        XCTAssertEqual(presenter?.spaceDate, expectationEntity.date)
    }
    
    func testloadSpaceByDateFailure() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: "01-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceService?.spaces.insert(expectationEntity)
        presenter?.spaceDate = nil
        
        //WHEN
        sut?.loadSpace()
        
        //THEN
        XCTAssertNil(presenter?.spaceDate)
    }
}
