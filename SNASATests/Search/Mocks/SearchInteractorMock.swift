//
//  SearchInteractorMock.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SearchInteractorMock: SearchInteractorProtocol {
    
    var searchDate: Date? = nil
    
    func getSpace(by date: Date) {
        searchDate = date
    }
}
