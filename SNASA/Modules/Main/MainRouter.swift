//
//  MainRouter.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol MainRouterProtocol: AnyObject {
    func openSpace(date: String)
}

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainControllerProtocol?
    
    func openSpace(date: String) {
        let vc = SpaceModuleBuilder.Build(spaceDate: date)
        viewController?.present(vc, animated: true)
    }
}
