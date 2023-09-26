//
//  MainControllerMock.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import UIKit
import XCTest
@testable import SNASA

class MainControllerMock: UIViewController, MainControllerProtocol {
    
    var newTitle = ""
    var newImage = ""
    var isUpdatedSpaces = false
    var isPresentSpaceController = false
    
    func updateTodaySpace(title: String, image: String) {
        newTitle = title
        newImage = image
    }
    
    func updateLasWeekSpaces(spaces: [SpaceEntity]) {
        isUpdatedSpaces = true
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if (viewControllerToPresent as? SpaceController) != nil {
            isPresentSpaceController = true
        }
    }
}
