//
//  MainInteractor.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    func loadTodaySpace()
    func loadLastWeekSpaces()
}

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol?
    let spaceSrvice = ServiceFacroty.sharedContainer.resolve(SpaceServiceProtocol.self)!
    
    func loadTodaySpace() {
        spaceSrvice.loadSpace(date: Date()) { [weak self] space in
            self?.presenter?.didLoadTodaySpace(title: space.title, image: space.url)
        }
    }
    
    func loadLastWeekSpaces() {
        spaceSrvice.loadSpaces(startDate: Date(), endDate: Date()) { [weak self] spaces in
            self?.presenter?.didLoadLastWeekSpaces(spaces: spaces)
        }
    }
}
