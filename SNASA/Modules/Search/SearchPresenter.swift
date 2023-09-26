//
//  SearchPresenter.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    func getSpace(by date: Date)
    func didLoadSpace(space: SpaceEntity)
}

class SearchPresenter: SearchPresenterProtocol {
    
    weak var viewController: SearchControllerProtocol?
    let router: SearchRouterProtocol
    let interactor: SearchInteractorProtocol
    
    init(router: SearchRouterProtocol, interactor: SearchInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func getSpace(by date: Date) {
        interactor.getSpace(by: date)
    }
    
    func didLoadSpace(space: SpaceEntity) {
        viewController?.updateSpace(space: space)
    }
}
