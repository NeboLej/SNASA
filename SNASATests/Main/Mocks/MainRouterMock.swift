//
//  MainRouterMock.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import Foundation

import XCTest
@testable import SNASA

class MainRouterMock: MainRouterProtocol {
    
    var isOpenSpace = false
    
    func openSpace(date: String) {
        isOpenSpace = true
    }  
}
