//
//  SpaceServiceMock.swift
//  SNASATests
//
//  Created by Nebo on 25.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class SpaceServiceMock: SpaceServiceProtocol {
    
    var entity: SpaceEntity?
    var delayMilliseconds: Int = 0
    var entities: [SpaceEntity]?
    
    func setupLoadSpace(entity: SpaceEntity?, delayMilliseconds: Int = 0 ) {
        self.entity = entity
        self.delayMilliseconds = delayMilliseconds
    }
    
    func setupLoadSpaces(entities: [SpaceEntity]?, delayMilliseconds: Int = 0 ) {
        self.entities = entities
        self.delayMilliseconds = delayMilliseconds
    }
    
    
    var spaces: Set<SpaceEntity> = []
    
    func getSpace(date: Date, completion: @escaping (SpaceEntity) -> Void) {
        guard let entity = entity else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delayMilliseconds) ) {
            completion(entity)
        }
    }
    
    func getSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceEntity]) -> (Void)) {
        guard let entities = entities else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delayMilliseconds) ) {
            completion(entities)
        }
    }
}
