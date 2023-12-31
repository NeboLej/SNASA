//
//  MainModuleBuilder.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

final class MainModuleBuilder {
    
    static func build() -> MainController {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(router: router, interactor: interactor)
        
        let controller = MainController()
        controller.presenter = presenter
        presenter.viewController = controller
        interactor.presenter = presenter
        router.viewController = controller
        return controller
    }
}
