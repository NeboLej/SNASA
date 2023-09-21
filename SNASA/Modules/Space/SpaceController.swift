//
//  SpaceController.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

protocol SpaceControllerProtocol: AnyObject {
    func showSpace()
}

class SpaceController: BaseViewController<SpaceView>, SpaceControllerProtocol {
    
    var presenter: SpacePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
        mainView.backgroundColor = .blue
    }
    
    func showSpace() {
        
    }
    
    func showImage(image: String) {
        DispatchQueue.main.async {
            self.mainView.image.image = UIImage(named: image)
        }
    }

    func showTwo(two: String) {
//        DispatchQueue.main.async {
//            self.mainView.two.text = two.description
//        }
    }
}
