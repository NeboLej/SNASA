//
//  SpaceInteractorMock.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SpaceInteractorMock: SpaceInteractorProtocol {
    
    var isLoadSpace = false
    
    func loadSpace() {
        isLoadSpace = true
    }
}
