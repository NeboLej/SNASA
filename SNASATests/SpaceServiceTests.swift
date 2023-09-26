//
//  SpaceServiceTests.swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import XCTest
@testable import SNASA

final class SpaceServiceTests: XCTestCase {

    var sut: SpaceService?
    var repository: SpaceRepositoryMock?
    
    override func setUp() {
        repository = SpaceRepositoryMock()
        sut = SpaceService(online: repository!)
        super.setUp()
    }
    
    override func tearDown() {
        repository = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetSpaceSucsessResponse() {
        //GIVEN
        var model = SpaceModel(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url", copyright: "copyright")
        var expectedEntity = SpaceEntity(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        
        repository?.setupLoadSpace(model: model, delayMilliseconds: 500)
        var expectation = expectation(description: "space")
        var actual: SpaceEntity?
        
        //WHEN
        sut?.getSpace(date: Date(), completion: {
            actual = $0
            expectation.fulfill()
        } )
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, expectedEntity)
    }
    
    func testGetSpaceNilResponse() {
        //GIVEN
        var expectedEntity: SpaceEntity? = nil
        var expectation = expectation(description: "space nil")
        expectation.isInverted = true
        var actual: SpaceEntity? = nil
        
        //WHEN
        sut?.getSpace(date: Date(), completion: {
            actual = $0
            expectation.fulfill()
        } )
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, expectedEntity)
    }
    
    func testGetSpacesSucsessResponse() {
        //GIVEN
        var models = [SpaceModel(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url", copyright: "copyright")]
        var expectedEntities = [SpaceEntity(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")]
        
        repository?.setupLoadSpaces(models: models, delayMilliseconds: 500)
        var expectation = expectation(description: "space")
        var actual: [SpaceEntity]?
        
        //WHEN
        sut?.getSpaces(startDate: Date(), endDate: Date(), completion: {
            actual = $0
            expectation.fulfill()
        })
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, expectedEntities)
    }
    
    func testGetSpacesNilResponse() {
        //GIVEN
        var expectedEntities: [SpaceEntity]? = nil
        var expectation = expectation(description: "space nil")
        expectation.isInverted = true
        var actual: [SpaceEntity]? = nil
        
        //WHEN
        sut?.getSpaces(startDate: Date(), endDate: Date(), completion: {
            actual = $0
            expectation.fulfill()
        })
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, expectedEntities)
    }
    
}
