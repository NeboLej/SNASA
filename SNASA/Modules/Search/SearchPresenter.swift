//
//  SearchPresenter.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    
}

class SearchPresenter: SearchPresenterProtocol {
    
    weak var viewController: SearchControllerProtocol?
    let router: SearchRouterProtocol
    let interactor: SearchInteractorProtocol
    
    init(router: SearchRouterProtocol, interactor: SearchInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
}
