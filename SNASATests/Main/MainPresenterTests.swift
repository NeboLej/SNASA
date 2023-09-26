//
//  MainPresenterTests.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import XCTest
@testable import SNASA

final class MainPresenterTests: XCTestCase {

    var sut: MainPresenter?
    var mockInteractor: MainInteractorMock?
    var mockRouter: MainRouterMock?
    var mockController: MainControllerMock?
    
    override func setUp()  {
        mockInteractor = MainInteractorMock()
        mockRouter = MainRouterMock()
        mockController = MainControllerMock()
        
        sut = MainPresenter(router: mockRouter!, interactor: mockInteractor!)
        sut?.viewController = mockController
        super.setUp()
    }

    override func tearDown() {
        mockInteractor = nil
        mockRouter = nil
        sut = nil
        super.tearDown()
    }
    
    
    func testViewDidLoadedSuccess() {
        //GIVEN
        mockInteractor?.isLoadTodaySpace = false
        mockInteractor?.isLoadLastWeekSpaces = false
        
        //WHEN
        sut?.viewDidLoaded()
        
        //THEN
        XCTAssertEqual(mockInteractor?.isLoadTodaySpace, true)
        XCTAssertEqual(mockInteractor?.isLoadLastWeekSpaces, true)
    }
    
    func testDidLoadTodaySpaceSuccess() {
        //GIVEN
        mockController?.newTitle = ""
        mockController?.newImage = ""
        
        //WHEN
        sut?.didLoadTodaySpace(title: "Test1", image: "Test2")
        
        //THEN
        XCTAssertEqual(mockController?.newTitle, "Test1")
        XCTAssertEqual(mockController?.newImage, "Test2")
    }
    
    func testDidLoadLastWeekSpacesSuccess() {
        //GIVEN
        mockController?.isUpdatedSpaces = false
        
        //WHEN
        sut?.didLoadLastWeekSpaces(spaces: [])
        
        //THEN
        XCTAssertEqual(mockController?.isUpdatedSpaces, true)
    }
    
    func testDidTapSpaceOpenSpace() {
        //GIVEN
        mockRouter?.isOpenSpace = false
        
        //WHEN
        sut?.didTapSpace(date: "")
        
        //THEN
        XCTAssertEqual(mockRouter?.isOpenSpace, true)
    }
}
