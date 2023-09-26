//
//  SearchInteractorTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class SearchInteractorTests: XCTestCase {

    var sut: SearchInteractor?
    var presenter: SearchPresenterMock?
    var spaceService: SpaceServiceMock?
    
    override func setUp() {
        presenter = SearchPresenterMock()
        spaceService = SpaceServiceMock()
        sut = SearchInteractor()
        sut?.spaceService = spaceService!
        sut?.presenter = presenter
        super.setUp()
    }
    
    override func tearDown() {
        presenter = nil
        spaceService = nil
        sut = nil
        super.tearDown()
    }
    
    func testLoadSpaceSuccess() {
        //GIVEN
        var expectationDate = Date()
        let expectationEntity = SpaceEntity(date: Date().toSimpleDate(), explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceService?.setupLoadSpace(entity: expectationEntity, delayMilliseconds: 500)
        
        //WHEN
        sut?.getSpace(by: expectationDate)
        
        //THEN
        wait(milliseconds: 1000)
        
        XCTAssertEqual(presenter?.space, expectationEntity)
    }
    
}
