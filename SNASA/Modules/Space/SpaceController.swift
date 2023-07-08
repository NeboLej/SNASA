//
//  SpaceController.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

protocol SpaceControllerProtocol: AnyObject {
    func showImage(image: String)
    func showTwo(two: String)
}

class SpaceController: UIViewController, SpaceControllerProtocol {
    
    var presenter: SpacePresenterProtocol?
    let mainView = SpaceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
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
