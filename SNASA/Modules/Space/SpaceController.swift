//
//  SpaceController.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

protocol SpaceControllerProtocol: AnyObject {
    func showSpace(space: SpaceEntity)
}

class SpaceController: BaseViewController<SpaceView>, SpaceControllerProtocol {
    
    var presenter: SpacePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
    }
    
    func showSpace(space: SpaceEntity) {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.updateView(date: space.date, imagePath: space.url, desc: space.explanation, title: space.title.uppercased())
        }
    }
    
//    func showImage(image: String) {
//        DispatchQueue.main.async {
//            self.mainView.image.image = UIImage(named: image)
//        }
//    }

    func showTwo(two: String) {
//        DispatchQueue.main.async {
//            self.mainView.two.text = two.description
//        }
    }
}
