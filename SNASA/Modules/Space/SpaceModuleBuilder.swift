//
//  SpaceModuleBuilder.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

class SpaceModuleBuilder {
    
    static func Build(spaceId: Int) -> SpaceController {
        let interactor = SpaceInteractor(spaceID: spaceId)
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
