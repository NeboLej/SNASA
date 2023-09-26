//
//  SpacePressenterMock.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SpacePresenterMock: SpacePresenterProtocol {
    
    var spaceDate: String? = nil
    var isViewDidLoaded = false
    
    func viewDidLoaded() {
        isViewDidLoaded = true
    }
    
    func didLoad(space: SpaceEntity?) {
        spaceDate = space?.date
    }
}
