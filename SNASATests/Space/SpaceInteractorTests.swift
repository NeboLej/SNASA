//
//  SpaceInteractorTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class SpaceInteractorTests: BaseTestCase {

    var sut: SpaceInteractor?
    var presenter: SpacePresenterMock?
    var spaceDate = "2000-01-01"
    var spaceServiceMock: SpaceServiceMock?
    
    override func setUp() {
        super.setUp()
        
        presenter = SpacePresenterMock()
        sut = SpaceInteractor(spaceDate: spaceDate)
        spaceServiceMock = injectedMock(for: SpaceServiceProtocol.self)
        sut?.presenter = presenter
    }
    
    override func tearDown() {
        presenter = nil
        spaceServiceMock = nil
        sut = nil
        super.tearDown()
    }
    
    func testloadSpaceByDateSuccess() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: spaceDate, explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceServiceMock?.spaces.insert(expectationEntity)
        presenter?.spaceDate = nil
        
        //WHEN
        sut?.loadSpace()
        
        //THEN
        XCTAssertEqual(presenter?.spaceDate, expectationEntity.date)
    }
    
    func testloadSpaceByDateFailure() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: "01-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceServiceMock?.spaces.insert(expectationEntity)
        presenter?.spaceDate = nil
        
        //WHEN
        sut?.loadSpace()
        
        //THEN
        XCTAssertNil(presenter?.spaceDate)
    }
}
