//
//  SpaceService.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation

protocol SpaceServiceProtocol {
    var spaces: Set<SpaceEntity> { get }
    
    func getSpace(date: Date, completion: @escaping (SpaceEntity) -> Void )
    func getSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceEntity]) -> Void )
}

class SpaceService: SpaceServiceProtocol {
    private let online: SpaceRepositoryProtocol
    
    var spaces: Set<SpaceEntity> = []
    
    init(online: SpaceRepositoryProtocol) {
        self.online = online
    }
    
    func getSpace(date: Date, completion: @escaping (SpaceEntity) -> Void ) {
        online.getSpace(date: date) { model in
            completion(SpaceEntity(model: model))
        }
    }
    
    func getSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceEntity]) -> Void ) {
        online.getSpaces(startDate: startDate, endDate: endDate) { models in
            let newSpaces = models.map { SpaceEntity(model: $0) }

            self.spaces.formUnion(newSpaces)
            completion(newSpaces.reversed())
        }
    }
}
