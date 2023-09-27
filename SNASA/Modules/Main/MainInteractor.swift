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

final class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol?
    
    @Injected
    var spaceService: SpaceServiceProtocol
    
    func loadTodaySpace() {
        spaceService.getSpace(date: Date()) { [weak self] space in
            self?.presenter?.didLoadTodaySpace(title: space.title, image: space.hdurl)
        }
    }
    
    func loadLastWeekSpaces() {
        spaceService.getSpaces(startDate: Date().addDay(day: -7), endDate: Date()) { [weak self] spaces in
            self?.presenter?.didLoadLastWeekSpaces(spaces: spaces)
        }
    }
}
