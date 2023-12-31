//
//  SearchInteractorTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class SearchInteractorTests: BaseTestCase {

    var sut: SearchInteractor?
    var presenter: SearchPresenterMock?
    var spaceServiceMock: SpaceServiceMock?
    
    override func setUp() {
        super.setUp()
        
        presenter = SearchPresenterMock()
        spaceServiceMock = injectedMock(for: SpaceServiceProtocol.self)
        sut = SearchInteractor()
        sut?.presenter = presenter
    }
    
    override func tearDown() {
        presenter = nil
        spaceServiceMock = nil
        sut = nil
        super.tearDown()
    }
    
    func testLoadSpaceSuccess() {
        //GIVEN
        let expectationDate = Date()
        let expectationEntity = SpaceEntity(date: Date().toSimpleDate(), explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        spaceServiceMock?.setupLoadSpace(entity: expectationEntity, delayMilliseconds: 500)
        
        //WHEN
        sut?.getSpace(by: expectationDate)
        
        //THEN
        wait(milliseconds: 1000)
        
        XCTAssertEqual(presenter?.space, expectationEntity)
    }
    
}
