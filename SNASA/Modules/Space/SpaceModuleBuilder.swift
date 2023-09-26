//
//  SpaceModuleBuilder.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

class SpaceModuleBuilder {
    
    static func build(spaceDate: String) -> SpaceController {
        let interactor = SpaceInteractor(spaceDate: spaceDate)
        let router = SpaceRouter()
        let presenter = SpacePresenter(router: router, interactor: interactor)
        
        let controller = SpaceController()
        controller.presenter = presenter
        presenter.viewController = controller
        interactor.presenter = presenter
        router.viewController = controller
        return controller
    }
}
