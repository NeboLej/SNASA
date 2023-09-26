//
//  SpaceModuleBuilder\Tests.swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import XCTest
@testable import SNASA

final class SpaceModuleBuilderTests: XCTestCase {
    
    func testBuild() {
        //GIVEN
        let expectedDate = "2000-01-01"
        
        //WHEN
        var actual = SpaceModuleBuilder.build(spaceDate: expectedDate)
        
        //THEN
        XCTAssertNotNil(actual.presenter)
        
        var interactor = (actual.presenter as? SpacePresenter)?.interactor
        var router = (actual.presenter as? SpacePresenter)?.router
        var viewController = (actual.presenter as? SpacePresenter)?.viewController
        
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(router)
        XCTAssertNotNil(viewController)
        
        XCTAssertNotNil((interactor as? SpaceInteractor)?.presenter)
        XCTAssertEqual((interactor as? SpaceInteractor)?.spaceDate, expectedDate)
        
        XCTAssertNotNil((router as? SpaceRouter)?.viewController)
        
        XCTAssertNotNil((viewController as? SpaceController)?.presenter)
    }
}
