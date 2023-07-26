//
//  SpaceInteractor.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol SpaceInteractorProtocol: AnyObject {
    func loadImage()
    func getTwo() -> String
}

class SpaceInteractor: SpaceInteractorProtocol {
    
    let spaceID: Int
    
    weak var presenter: SpacePresenterProtocol?
    
    init(spaceID: Int) {
        self.spaceID = spaceID
    }
    
    func loadImage() {
//        service.loadImage { [weak self] image in
//            self?.presenter?.didLoad(image: image)
//        }
    }
    
    func getTwo() -> String {
        spaceID > 0 ? "Minus" : "Plus"
    }
}
