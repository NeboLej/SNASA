//
//  SpacePresenter.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol SpacePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(image: String?)
}

class SpacePresenter: SpacePresenterProtocol {

    weak var viewController: SpaceControllerProtocol?
    let router: SpaceRouterProtocol
    let interactor: SpaceInteractorProtocol
    
    init(router: SpaceRouterProtocol, interactor: SpaceInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoaded() {
        interactor.loadImage()
    }
    
    func didLoad(image: String?) {
        
    }
}
