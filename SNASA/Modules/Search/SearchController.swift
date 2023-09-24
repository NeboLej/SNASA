//
//  SearchController.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import UIKit

protocol SearchControllerProtocol: AnyObject {
    func updateSpace(space: SpaceEntity)
}

protocol SearchListenerProtocol {
    func search(date: Date)
}

class SearchController: BaseViewController<SearchView>, SearchControllerProtocol {
    
    var presenter: SearchPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
        
        weak var _self = self
        mainView.searchListener = _self
    }
    
    func updateSpace(space: SpaceEntity) {
        DispatchQueue.main.async {
            self.mainView.updateSpace(label: space.title, imagePath: space.url, desc: space.explanation, date: space.date)
        }
    }
}

extension SearchController: SearchListenerProtocol {
    func search(date: Date) {
        presenter?.getSpace(by: date)
    }
}
