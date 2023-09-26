//
//  SpacePresenterTests.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import XCTest
@testable import SNASA

final class SpacePresenterTests: XCTestCase {

    var sut: SpacePresenter?
    var router: SpaceRouterMock?
    var interactor: SpaceInteractorMock?
    var controller: SpaceControllerMock?
    
    override func setUp() {
        router = SpaceRouterMock()
        interactor = SpaceInteractorMock()
        controller = SpaceControllerMock()
        
        sut = SpacePresenter(router: router!, interactor: interactor!)
        sut?.viewController = controller
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        router = nil
        interactor = nil
        controller = nil
        super.tearDown()
    }
    
    func testDidLoadEntityNotNil() {
        //GIVEN
        let expectationEntity = SpaceEntity(date: "2000-01-01", explanation: "explanation", hdurl: "hdurl", mediaType: "mediaType", serviceVersion: "serviceVersion", title: "title", url: "url")
        controller?.space = nil
        
        //WHEN
        sut?.didLoad(space: expectationEntity)
        
        //THEN
        XCTAssertEqual(controller?.space, expectationEntity)
    }
    
    
    func testDidLoadEntityNil() {
        //GIVEN
        let expectationEntity: SpaceEntity? = nil
        controller?.space = nil
        
        //WHEN
        sut?.didLoad(space: expectationEntity)
        
        //THEN
        XCTAssertNil(controller?.space)
    }
    
    func testViewDidLoaded() {
        //GIVEN
        interactor?.isLoadSpace = false
        
        //WHEN
        sut?.viewDidLoaded()
        
        //THEN
        XCTAssertEqual(interactor?.isLoadSpace, true)
    }
}
