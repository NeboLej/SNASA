//
//  BaseRepository.swift
//  SNASA
//
//  Created by Nebo on 25.07.2023.
//

import Foundation
import Alamofire

class BaseRepository {
    let api: NetworkApiProtocol
    
    init(api: NetworkApiProtocol) {
        self.api = api
    }
}
