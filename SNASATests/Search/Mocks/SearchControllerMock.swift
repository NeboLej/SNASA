//
//  SearchControllerMock.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SearchControllerMock: SearchControllerProtocol {
    
    var updatedSpace: SpaceEntity? = nil
    
    func updateSpace(space: SpaceEntity) {
        updatedSpace = space
    }
}
