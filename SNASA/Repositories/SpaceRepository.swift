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
    
    func getSpace(date: Date, completion: @escaping (SpaceModel) -> Void ) {
        fetchData(target: GGG(baseURL: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY", path: "", method: .get, task: .requestPlain, headers: ["date": "2023-07-26"]), responseClass: SpaceModel.self) { result in
            
            print("json ---- \(result)")
            print("error ---- \(result)")
            guard let result = try? result.get() else { return }
            completion(result)
        }
    }
    
    
    
    
    
    func getSpaces(startdate: Date, endDate: Date, completion: @escaping ([SpaceModel]) -> Void ) {
        
    }
}


struct GGG : TargetType {
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var task: Task
    var headers: [String : String]?
}
