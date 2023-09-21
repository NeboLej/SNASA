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
    
    let spaceDate: String
    
    weak var presenter: SpacePresenterProtocol?
    
    init(spaceDate: String) {
        self.spaceDate = spaceDate
    }
    
    func loadImage() {
//        service.loadImage { [weak self] image in
//            self?.presenter?.didLoad(image: image)
//        }
    }
    
    func getTwo() -> String {
        spaceDate == "0" ? "Minus" : "Plus"
    }
}
