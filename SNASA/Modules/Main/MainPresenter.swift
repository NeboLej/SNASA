//
//  MainPresenter.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(date: String?)
    func didLoad(two: Int)
    func didTapSpace()
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
        interactor.loadDate()
        interactor.loadTwo()
    }
    
    func didLoad(date: String?) {
        viewController?.showDate(date: date ?? "No date")
    }
    
    func didLoad(two: Int) {
        viewController?.showTwo(two: two)
    }
    
    func didTapSpace() {
        router.openSpace(id: 0)
    }
}
