//
//  SpaceService.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation

protocol SpaceServiceProtocol {
    func loadSpace(date: Date, completion: @escaping (SpaceEntity) -> Void )
    func loadSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceEntity]) -> Void )
}

class SpaceService: SpaceServiceProtocol {
    let online: SpaceRepositoryProtocol
    
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
            completion(models.map { SpaceEntity(model: $0) })
        }
    }
}

