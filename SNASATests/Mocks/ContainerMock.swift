//
//  ContainerMock.swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import Foundation
import Swinject
import XCTest
@testable import SNASA

class ContainerMock {
    
    static func buildContainer() -> Container {
        let container = Container()
        
        container.register(SpaceRepositoryProtocol.self) { resolver in
            return SpaceRepositoryMock()
        }.inObjectScope(.container)
        
        container.register(SpaceServiceProtocol.self) { resolver in
            return SpaceServiceMock()
        }.inObjectScope(.container)
        
        return container
    }
}
