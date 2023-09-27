//
//  BaseTestCase.swift
//  SNASATests
//
//  Created by Nebo on 27.09.2023.
//

import Foundation
import XCTest
import Swinject
@testable import SNASA
 
class BaseTestCase: XCTestCase {
    
  override func setUp() {
    super.setUp()
 
    Injection.shared.container = buildMockContainer()
  }
 
  func injectedMock<Dependency, Mock>(for dependencyType: Dependency.Type) -> Mock? {
    return Injection.shared.container.resolve(Dependency.self) as? Mock
  }
 
  private func buildMockContainer() -> Container {
      let container = Container()
      
      container.register(SpaceServiceProtocol.self) { resolver in
          return SpaceServiceMock()
      }.inObjectScope(.container)
      
      return container
  }
}
