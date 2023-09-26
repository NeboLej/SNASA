//
//  SpaceRepository.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation

protocol SpaceRepositoryProtocol {
    func getSpace(date: Date, completion: @escaping (SpaceModel) -> Void)
    func getSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceModel]) -> Void)
}

class SpaceRepository: BaseRepository, SpaceRepositoryProtocol {
    
    let url: String
    
    init(api: NetworkApiProtocol, url: String) {
        self.url = url
        super.init(api: api)
    }
    
    func getSpace(date: Date, completion: @escaping (SpaceModel) -> Void ) {
        let parameters = ["date": date.toSimpleDate()]
        api.fetchData(target: RquestOptions(baseURL: url, path: "", method: .get, task: .requestParameters(parameters: parameters), headers: [:]), responseClass: SpaceModel.self) { result in
            guard let result = try? result.get() else { return }
            completion(result)
        }
    }
    
    func getSpaces(startDate: Date, endDate: Date, completion: @escaping ([SpaceModel]) -> Void ) {
        let parameters = ["start_date": startDate.toSimpleDate(), "end_date": endDate.toSimpleDate()]
        api.fetchData(target: RquestOptions(baseURL: url, path: "", method: .get, task: .requestParameters(parameters: parameters), headers: [:]), responseClass: [SpaceModel].self) { result in
            guard let result = try? result.get() else { return }
            completion(result)
        }
    }
}
