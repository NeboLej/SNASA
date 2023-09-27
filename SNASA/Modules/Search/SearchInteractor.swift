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

final class SearchInteractor: SearchInteractorProtocol {
    
    @Injected
    var spaceService: SpaceServiceProtocol
    
    weak var presenter: SearchPresenterProtocol?
    
    func getSpace(by date: Date) {
        spaceService.getSpace(date: date) { [ weak self] space in
            self?.presenter?.didLoadSpace(space: space)
        }
    }
}
