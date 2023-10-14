//
//  SearchRouter.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import Foundation

protocol SearchRouterProtocol: AnyObject {}

final class SearchRouter: SearchRouterProtocol {
    
    weak var viewController: SearchControllerProtocol?
}
