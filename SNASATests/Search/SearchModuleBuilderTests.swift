//
//  SearchModuleBuilderTests.swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import XCTest
@testable import SNASA

final class SearchModuleBuilderTests: XCTestCase {
    
    func testBuild() {
        //GIVEN
        
        //WHEN
        var actual = SearchModuleBuilder.build()
        
        //THEN
        XCTAssertNotNil(actual.presenter)
        
        var interactor = (actual.presenter as? SearchPresenter)?.interactor
        var router = (actual.presenter as? SearchPresenter)?.router
        var viewController = (actual.presenter as? SearchPresenter)?.viewController
        
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(router)
        XCTAssertNotNil(viewController)
        
        XCTAssertNotNil((interactor as? SearchInteractor)?.presenter)
        
        XCTAssertNotNil((router as? SearchRouter)?.viewController)
        
        XCTAssertNotNil((viewController as? SearchController)?.presenter)
    }
}
