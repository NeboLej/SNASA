//
//  SearchModuleBuilder.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import Foundation

final class SearchModuleBuilder {
    
    static func build() -> SearchController {
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(router: router, interactor: interactor)
        
        let viewController = SearchController()
        viewController.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.presenter = presenter
        return viewController
    }
}
