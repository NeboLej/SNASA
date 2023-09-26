//
//  SpaceRepositoryTests.swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import XCTest
@testable import SNASA

final class SpaceRepositoryTests: XCTestCase {

    var sut: SpaceRepository?
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGetSpaceSuccess() {
        //GIVEN
        let networkApiMock = NetworkApiMock<SpaceModel>()
        sut = SpaceRepository(api: networkApiMock, url: "")
        
        var expectedModel = SpaceModel(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url", copyright: "copyright")
        networkApiMock.setupResponse(response: expectedModel, delayMilliseconds: 500)
        var expectation = expectation(description: "api")
        var actual: SpaceModel?
        
        //WHEN
        sut?.getSpace(date: Date(), completion: {
            actual = $0
            expectation.fulfill()
        })
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, expectedModel)
    }
    
    func testGetSpaceFailure() {
        //GIVEN
        let networkApiMock = NetworkApiMock<SpaceModel>()
        sut = SpaceRepository(api: networkApiMock, url: "")
        
        networkApiMock.setupResponse(response: nil, delayMilliseconds: 500)
        var expectation = expectation(description: "api")
        expectation.isInverted = true
        var actual: SpaceModel?
        
        //WHEN
        sut?.getSpace(date: Date(), completion: {
            actual = $0
            expectation.fulfill()
        })
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, nil)
    }
    
    func testGetSpacesSuccess() {
        //GIVEN
        let networkApiMock = NetworkApiMock<[SpaceModel]>()
        sut = SpaceRepository(api: networkApiMock, url: "")
        
        var expectedModels = [SpaceModel(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url", copyright: "copyright")]
        networkApiMock.setupResponse(response: expectedModels, delayMilliseconds: 500)
        var expectation = expectation(description: "api")
        var actual: [SpaceModel]?
        
        //WHEN
        sut?.getSpaces(startDate: Date(), endDate: Date(), completion: {
            actual = $0
            expectation.fulfill()
        })
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, expectedModels)
    }
    
    func testGetSpacesFailure() {
        //GIVEN
        let networkApiMock = NetworkApiMock<[SpaceModel]>()
        sut = SpaceRepository(api: networkApiMock, url: "")
        
        networkApiMock.setupResponse(response: nil, delayMilliseconds: 500)
        var expectation = expectation(description: "api")
        expectation.isInverted = true
        var actual: [SpaceModel]?
        
        //WHEN
        sut?.getSpaces(startDate: Date(), endDate: Date(), completion: {
            actual = $0
            expectation.fulfill()
        })
        
        //THEN
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(actual, nil)
    }
}
