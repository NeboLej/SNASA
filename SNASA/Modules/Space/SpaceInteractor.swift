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

class SpaceInteractor: SpaceInteractorProtocol {
    
    var spaceSrvice = ServiceFacroty.sharedContainer.resolve(SpaceServiceProtocol.self)!
    let spaceDate: String
    
    weak var presenter: SpacePresenterProtocol?
    
    init(spaceDate: String) {
        self.spaceDate = spaceDate
    }
    
    func loadSpace() {
        let space = spaceSrvice.spaces.first(where: { $0.date == spaceDate })
        presenter?.didLoad(space: space)
    }
}
