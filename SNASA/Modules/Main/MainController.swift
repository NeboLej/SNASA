//
//  MainController.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

protocol MainControllerProtocol: AnyObject where Self: UIViewController {
    func updateTodaySpace(title: String, image: String)
    func updateLasWeekSpaces(spaces: [SpaceEntity])
}

protocol SpaceListenerProtocol {
    func onClick(space: SpaceEntity)
}

final class MainController: BaseViewController<MainView>, MainControllerProtocol {
    
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
        mainView.spaceListener = self
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
}

extension MainController: SpaceListenerProtocol {
    func onClick(space: SpaceEntity) {
        presenter?.didTapSpace(date: space.date)
    }
}
