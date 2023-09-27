//
//  Injection.swift
//  SNASA
//
//  Created by Nebo on 27.07.2023.
//

import Foundation
import Swinject

@propertyWrapper struct Injected<Dependency> {
  let wrappedValue: Dependency
 
  init() {
    self.wrappedValue = Injection.shared.container.resolve(Dependency.self)!
  }
}

final class Injection {
    
    static let shared = Injection()
    
    var container: Container {
        get {
            if _container == nil { _container = buildContainer() }
            return _container!
        }
        set {
            _container = newValue
        }
    }
    private var _container: Container?
     
    private func buildContainer() -> Container {
        let container = Container()
        
        container.register(NetworkApiProtocol.self) { _ in
            AlamofireApiClient()
        }
        
        container.register(SpaceRepositoryProtocol.self) { resolver in
            let api = resolver.resolve(NetworkApiProtocol.self)!
            return SpaceRepository(api: api, url: "https://api.nasa.gov/planetary/apod?api_key=6AmV7VDduhMHFu2xZy3LDxWsTtUFhLEtiz5f45ms")
        }
        
        container.register(SpaceServiceProtocol.self) { resolver in
            let repo = resolver.resolve(SpaceRepositoryProtocol.self)!
            return SpaceService(online: repo)
        }.inObjectScope(.container)
        
        return container
    }
}
