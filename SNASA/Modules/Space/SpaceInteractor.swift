//
//  SpaceInteractor.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol SpaceInteractorProtocol: AnyObject {
    func loadSpace()
}

final class SpaceInteractor: SpaceInteractorProtocol {
    
    @Injected
    var spaceService: SpaceServiceProtocol
    
    let spaceDate: String
    
    weak var presenter: SpacePresenterProtocol?
    
    init(spaceDate: String) {
        self.spaceDate = spaceDate
    }
    
    func loadSpace() {
        let space = spaceService.spaces.first(where: { $0.date == spaceDate })
        presenter?.didLoad(space: space)
    }
}
