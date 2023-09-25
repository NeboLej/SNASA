//
//  SearchInteractor.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
    func getSpace(by date: Date)
}

class SearchInteractor: SearchInteractorProtocol {
    
    weak var presenter: SearchPresenterProtocol?
    
    let spaceService = ServiceFacroty.sharedContainer.resolve(SpaceServiceProtocol.self)!
    
    func getSpace(by date: Date) {
        spaceService.loadSpace(date: date) { [ weak self] space in
            self?.presenter?.didLoadSpace(space: space)
        }
    }
}