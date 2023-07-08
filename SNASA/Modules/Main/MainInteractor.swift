//
//  MainInteractor.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    func loadDate()
    func loadTwo()
}

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol?
    let service = TmpService()
    
    func loadDate() {
        service.loadDate { [weak self] date in
            self?.presenter?.didLoad(date: date.description)
        }
    }
    
    func loadTwo() {
        service.loadTwo { t in
            self.presenter?.didLoad(two: t)
        }
    }
}
