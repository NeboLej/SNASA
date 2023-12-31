//
//  MainInteractorTests.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import XCTest
@testable import SNASA

final class MainInteractorTests: BaseTestCase {

    var sut: MainInteractor?
    var presenterMock: MainPresenterMock?
    var spaceServiceMock: SpaceServiceMock?
    
    override func setUp() {
        super.setUp()

        presenterMock = MainPresenterMock()
        sut = MainInteractor()
        spaceServiceMock = injectedMock(for: SpaceServiceProtocol.self)
        sut?.presenter = presenterMock
    }

    override func tearDown() {
        spaceServiceMock = nil
        presenterMock = nil
        sut = nil
        super.tearDown()
    }
    
    func testLoadTodaySpaceSuccess() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceServiceMock?.setupLoadSpace(entity: expectationEntity, delayMilliseconds: 500)
        presenterMock?.title = ""
        presenterMock?.image = ""
        
        //WHEN
        sut?.loadTodaySpace()
        
        //THEN
        wait(milliseconds: 1000)
        
        XCTAssertEqual(presenterMock?.title, expectationEntity.title)
        XCTAssertEqual(presenterMock?.image, expectationEntity.hdurl)
    }
    
    func testLoadTodaySpaceNotResponce() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceServiceMock?.setupLoadSpace(entity: expectationEntity, delayMilliseconds: 1500)
        presenterMock?.title = ""
        presenterMock?.image = ""
        
        //WHEN
        sut?.loadTodaySpace()
        
        //THEN
        wait(milliseconds: 1000)
        
        XCTAssertNotEqual(presenterMock?.title, expectationEntity.title)
        XCTAssertNotEqual(presenterMock?.image, expectationEntity.hdurl)
    }
    
    
    func testLoadLastWeakSpacesSuccess() {
        //GIVEN
        let expectationEntities = [SpaceEntity(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")]
        spaceServiceMock?.setupLoadSpaces(entities: expectationEntities, delayMilliseconds: 500)
        presenterMock?.spaces = []
        
        //WHEN
        sut?.loadLastWeekSpaces()
        
        //THEN
        wait(milliseconds: 1000)
        
        XCTAssertEqual(presenterMock?.spaces, expectationEntities)
    }
}
        

