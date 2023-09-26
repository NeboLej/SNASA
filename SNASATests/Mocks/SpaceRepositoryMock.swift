//
//  SpaceRepositoryMock.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SpaceRepositoryMock: SpaceRepositoryProtocol {
    
    var model: SpaceModel?
    var delayMilliseconds: Int = 0
    var models: [SpaceModel]?
    
    func setupLoadSpace(model: SpaceModel?, delayMilliseconds: Int = 0 ) {
        self.model = model
        self.delayMilliseconds = delayMilliseconds
    }
    
    func setupLoadSpaces(models: [SpaceModel]?, delayMilliseconds: Int = 0 ) {
        self.models = models
        self.delayMilliseconds = delayMilliseconds
    }
    
    
    func getSpace(date: Date, completion: @escaping (SpaceModel) -> Void) {
        guard let model = model else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delayMilliseconds) ) {
            completion(model)
        }
    }
    
    func getSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceModel]) -> Void) {
        guard let models = models else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delayMilliseconds) ) {
            completion(models)
        }
    }
}
