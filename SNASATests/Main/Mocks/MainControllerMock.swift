//
//  MainControllerMock.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class MainControllerMock: MainControllerProtocol {
    
    var newTitle = ""
    var newImage = ""
    var isUpdatedSpaces = false
    
    func updateTodaySpace(title: String, image: String) {
        newTitle = title
        newImage = image
    }
    
    func updateLasWeekSpaces(spaces: [SpaceEntity]) {
        isUpdatedSpaces = true
    }
}
