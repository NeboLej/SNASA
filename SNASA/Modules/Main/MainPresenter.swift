//
//  MainPresenter.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoadTodaySpace(title: String, image: String)
    func didLoadLastWeekSpaces(spaces: [SpaceEntity])
    func didTapSpace(date: String)
}

class MainPresenter: MainPresenterProtocol {

    weak var viewController: MainControllerProtocol?
    let router: MainRouterProtocol
    let interactor: MainInteractorProtocol
    
    init(router: MainRouterProtocol, interactor: MainInteractorProtocol) { 
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoaded() {
        interactor.loadTodaySpace()
        interactor.loadLastWeekSpaces()
    }
    
    func didLoadTodaySpace(title: String, image: String) {
        viewController?.updateTodaySpace(title: title, image: image)
    }
    
    func didLoadLastWeekSpaces(spaces: [SpaceEntity]) {
        viewController?.updateLasWeekSpaces(spaces: spaces)
    }
    
    func didTapSpace(date: String) {
        router.openSpace(date: date)
    }
}
