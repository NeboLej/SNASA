//
//  NetworkApiProtocol.swift
//  SNASA
//
//  Created by Nebo on 27.07.2023.
//

import Foundation

protocol NetworkApiProtocol {
    func fetchData<M: Decodable>(target: TargetType, responseClass: M.Type, completionHandler:@escaping (Result<M, NSError>)-> Void)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get } 
}
