//
//  MainPresenterMock.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class MainPresenterMock: MainPresenterProtocol {
    
    var title = ""
    var image = ""
    var spaces: [SpaceEntity] = []
    var isViewDidLoaded = false
    
    func viewDidLoaded() {
        isViewDidLoaded = true
    }
    
    func didLoadTodaySpace(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    func didLoadLastWeekSpaces(spaces: [SpaceEntity]) {
        self.spaces = spaces
    }
    
    func didTapSpace(date: String) {
        
    }
}
