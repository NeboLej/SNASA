//
//  MainInteractorMock.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class MainInteractorMock: MainInteractorProtocol {
    
    var isLoadTodaySpace = false
    var isLoadLastWeekSpaces = false 
    
    func loadTodaySpace() {
        isLoadTodaySpace = true
    }
    
    func loadLastWeekSpaces() {
        isLoadLastWeekSpaces = true
    }
}
