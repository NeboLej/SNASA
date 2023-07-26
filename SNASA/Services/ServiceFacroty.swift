//
//  ServiceFacroty.swift
//  SNASA
//
//  Created by Nebo on 27.07.2023.
//

import Foundation
import Swinject

class ServiceFacroty {
    
    static let sharedContainer: Container = {
        let container = Container()
        
        container.register(SpaceRepositoryProtocol.self) { _ in
            SpaceRepository()
        }
        
        container.register(SpaceServiceProtocol.self) { resolver in
            let repo = resolver.resolve(SpaceRepositoryProtocol.self)!
            return SpaceService(online: repo)
        }
        
        return container
    }()
}
