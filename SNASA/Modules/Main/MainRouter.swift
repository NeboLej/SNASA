//
//  MainRouter.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol MainRouterProtocol: AnyObject {
    func openSpace(id: Int)
}

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainController?
    
    func openSpace(id: Int) {
        let vc = SpaceModuleBuilder.Build(spaceId: id)
        viewController?.present(vc, animated: true)
    }
}
