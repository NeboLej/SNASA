//
//  AlamofireApiClient.swift
//  SNASA
//
//  Created by Nebo on 27.07.2023.
//

import Foundation
import Alamofire

class AlamofireApiClient: NetworkApiProtocol {
    
    func fetchData<M: Decodable>(target: TargetType, responseClass: M.Type, completionHandler: @escaping (Result<M, NSError>) -> Void) {
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(task: target.task)
        
        AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else {
                print("StatusCode not found")
                completionHandler(.failure(NSError()))
                return
            }
            
            if statusCode == 200 {
                
                guard let jsonResponse = try? response.result.get() else {
                    print("jsonResponse error")
                    completionHandler(.failure(NSError()))
                    return
                }
                
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    print("theJSONData error")
                    completionHandler(.failure(NSError()))
                    return
                }
                
                guard let responseObj = try? JSONDecoder().decode(M.self, from: theJSONData) else {
                    print("responseObj error")
                    completionHandler(.failure(NSError()))
                    return }
                completionHandler(.success(responseObj))
                
            } else {
                print("error statusCode is \(statusCode)")
                completionHandler(.failure(NSError()))
            }
        }
    }

    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters):
            return (parameters, URLEncoding.default)
        }
    }
}


enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any])
}

struct RquestOptions : TargetType {
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var task: Task
    var headers: [String : String]?
}
