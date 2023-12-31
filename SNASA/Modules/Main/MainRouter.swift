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

final class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainControllerProtocol?
    
    func openSpace(date: String) {
        let vc = SpaceModuleBuilder.build(spaceDate: date)
        viewController?.present(vc, animated: true)
    }
}
