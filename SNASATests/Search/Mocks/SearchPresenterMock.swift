//
//  SearchPresenterMock.swift
//  SNASATests
//
//  Created by Nebo on 26.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SearchPresenterMock: SearchPresenterProtocol {
    
    var space: SpaceEntity? = nil
    
    
    func getSpace(by date: Date) {
        
    }
    
    func didLoadSpace(space: SpaceEntity) {
        self.space = space
    }
}
