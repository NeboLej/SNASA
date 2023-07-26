//
//  BaseRepository.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation
import Alamofire

class BaseRepository {

    func fetchData<M: Decodable>(target: TargetType, responseClass: M.Type, completionHandler:@escaping (Result<M, NSError>)-> Void) {
        // 5
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(task: target.task)
        
        AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseJSON { (response) in
            // 6
            guard let statusCode = response.response?.statusCode else {
                print("StatusCode not found")
                completionHandler(.failure(NSError()))
                return
            }
            
            // 7
            if statusCode == 200 {
                
                // 8
                guard let jsonResponse = try? response.result.get() else {
                    print("jsonResponse error")
                    completionHandler(.failure(NSError()))
                    return
                }
                // 9
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    print("theJSONData error")
                    completionHandler(.failure(NSError()))
                    return
                }
                // 10
                guard let responseObj = try? JSONDecoder().decode(M.self, from: theJSONData) else {
                    print("responseObj error")
                    completionHandler(.failure(NSError()))
                    return
                }
                completionHandler(.success(responseObj))
                
            } else {
                print("error statusCode is \(statusCode)")
                completionHandler(.failure(NSError()))
                
            }
            
        }
    }

    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
    
}

enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol TargetType {
    
    var baseURL: String {get}
    
    var path: String {get}
    
    var method: HTTPMethod {get}
    
    var task: Task {get}
    
    var headers: [String: String]? {get}
}
