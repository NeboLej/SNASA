//
//  NetworkApiMock.swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import Foundation
import XCTest
@testable import SNASA

class NetworkApiMock<T>: NetworkApiProtocol {
    
    var response: T?
    var delayMilliseconds: Int = 0
    
    func setupResponse(response: T?, delayMilliseconds: Int = 0) {
        self.response = response
        self.delayMilliseconds = delayMilliseconds
    }
    
    func fetchData<M>(target: TargetType, responseClass: M.Type, completionHandler: @escaping (Result<M, NSError>) -> Void) where M : Decodable {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delayMilliseconds) ) {
            if self.response != nil {
                completionHandler(.success(self.response as! M))
            } else {
                completionHandler(.failure(NSError()))
            }
        }
    }
}
