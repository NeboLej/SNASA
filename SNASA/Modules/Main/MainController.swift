//
//  MainController.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

protocol MainControllerProtocol: AnyObject {
    func updateTodaySpace(title: String, image: String)
    func updateLasWeekSpaces(spaces: [SpaceEntity])
}

class MainController: BaseViewController<MainView>, MainControllerProtocol {
    
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
    }
    
    func updateTodaySpace(title: String, image: String) {
        DispatchQueue.main.async {
            self.mainView.updateTodaySpaceView(imagePath: image, title: title)
        }
    }
    
    func updateLasWeekSpaces(spaces: [SpaceEntity]) {
        DispatchQueue.main.async {
            self.mainView.updeteLastWeekSpaces(spaces: spaces)
        }
    }

    func tapSpace() {
        presenter?.didTapSpace()
    }
}
