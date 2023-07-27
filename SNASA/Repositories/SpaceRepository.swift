//
//  SpaceRepository.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation

protocol SpaceRepositoryProtocol {
    func getSpace(date: Date, completion: @escaping (SpaceModel) -> Void)
    func getSpaces(startdate: Date, endDate: Date, completion: @escaping ([SpaceModel]) -> Void)
}

class SpaceRepository: BaseRepository, SpaceRepositoryProtocol {
    
    let url: String
    
    init(api: NetworkApiProtocol, url: String) {
        self.url = url
        super.init(api: api)
    }
    
    func getSpace(date: Date, completion: @escaping (SpaceModel) -> Void ) {
        api.fetchData(target: RquestOptions(baseURL: url, path: "", method: .get, task: .requestPlain, headers: ["date": "2023-07-27"]), responseClass: SpaceModel.self) { result in
            print("result ---- \(result)")
            guard let result = try? result.get() else { return }
            completion(result)
        }
    }
    
    func getSpaces(startdate: Date, endDate: Date, completion: @escaping ([SpaceModel]) -> Void ) {
        
    }
}
