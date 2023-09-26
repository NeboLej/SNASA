//
//  MainModuleBuilderTests().swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import XCTest
@testable import SNASA

final class MainModuleBuilderTests: XCTestCase {
    
    func testBuild() {
        //GIVEN
        
        //WHEN
        var actual = MainModuleBuilder.build()
        
        //THEN
        XCTAssertNotNil(actual.presenter)
        
        var interactor = (actual.presenter as? MainPresenter)?.interactor
        var router = (actual.presenter as? MainPresenter)?.router
        var viewController = (actual.presenter as? MainPresenter)?.viewController
        
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(router)
        XCTAssertNotNil(viewController)
        
        XCTAssertNotNil((interactor as? MainInteractor)?.presenter)
        
        XCTAssertNotNil((router as? MainRouter)?.viewController)
        
        XCTAssertNotNil((viewController as? MainController)?.presenter)
    }
}

