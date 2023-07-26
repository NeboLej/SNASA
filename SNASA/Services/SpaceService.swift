//
//  SpaceService.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation

class SpaceService {
    
    let repos = SpaceRepository()
    
    func loadSpace(date: Date, completion: @escaping (SpaceEntity) -> Void ) {
        self.repos.getSpace(date: Date()) { model in
            completion(SpaceEntity(model: model))
        }
    }
    
    func loadSpaces(fromDate: Date, toDate: Date, completion: @escaping ([SpaceEntity]) -> Void ) {
        
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

