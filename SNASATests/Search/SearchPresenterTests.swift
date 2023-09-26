//
//  SearchPresenterTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class SearchPresenterTests: XCTestCase {

    var sut: SearchPresenter?
    var interactor: SearchInteractorMock?
    var router: SearchRouterMock?
    var controller: SearchControllerMock?
    
    override func setUp() {
        interactor = SearchInteractorMock()
        router = SearchRouterMock()
        controller = SearchControllerMock()
        sut = SearchPresenter(router: router!, interactor: interactor!)
        sut?.viewController = controller
        super.setUp()
    }
    
    override func tearDown() {
        interactor = nil
        router = nil
        controller = nil
        sut = nil
        super.tearDown()
    }

    func testGetSpaceByDate() {
        //GIVEN
        var expectationDate = Date()
        
        //WHEN
        sut?.getSpace(by: expectationDate)
        
        //THEN
        XCTAssertEqual(interactor?.searchDate, expectationDate)
    }
    
    func testDidLoadSpace() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        
        //WHEN
        sut?.didLoadSpace(space: expectationEntity)
        
        //THEN
        XCTAssertEqual(controller?.updatedSpace, expectationEntity)
    }
}
