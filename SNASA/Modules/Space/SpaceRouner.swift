//
//  SpaceRouner.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol SpaceRouterProtocol: AnyObject {
    
}

final class SpaceRouter: SpaceRouterProtocol {
    
    weak var viewController: SpaceControllerProtocol?
}
