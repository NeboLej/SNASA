//
//  SpaceService.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation

protocol SpaceServiceProtocol {
    var spaces: Set<SpaceEntity> { get }
    
    func loadSpace(date: Date, completion: @escaping (SpaceEntity) -> Void )
    func loadSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceEntity]) -> Void )
}

class SpaceService: SpaceServiceProtocol {
    let online: SpaceRepositoryProtocol
    
    var spaces: Set<SpaceEntity> = []
    
    init(online: SpaceRepositoryProtocol) {
        self.online = online
    }
    
    func loadSpace(date: Date, completion: @escaping (SpaceEntity) -> Void ) {
        online.getSpace(date: Date()) { model in
            completion(SpaceEntity(model: model))
        }
    }
    
    func loadSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceEntity]) -> Void ) {
        online.getSpaces(startDate: startDate, endDate: endDate) { models in
            let newSpaces = models.map { SpaceEntity(model: $0) }

            self.spaces.formUnion(newSpaces)
            completion(newSpaces.reversed())
        }
    }
}
