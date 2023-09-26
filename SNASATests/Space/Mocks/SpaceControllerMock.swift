//
//  SpaceControllerMock.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SpaceControllerMock: SpaceControllerProtocol {
    
    var space: SpaceEntity? = nil
    
    func showSpace(space: SpaceEntity) {
        self.space = space
    }
}
