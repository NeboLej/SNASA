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
        self.online.getSpace(date: Date()) { model in
            completion(SpaceEntity(model: model))
        }
    }
    
    func loadSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceEntity]) -> Void ) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion([
                .init(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "1111", url: "testImage"),
                .init(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "2222", url: "testImage"),
                .init(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "3333", url: "testImage"),
                .init(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "4444", url: "testImage"),]
            )
        }
    }
}

