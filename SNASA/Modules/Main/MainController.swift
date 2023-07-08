//
//  MainController.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

protocol MainControllerProtocol: AnyObject {
    func showDate(date: String)
    func showTwo(two: Int)
}

class MainController: BaseViewController<MainView>, MainControllerProtocol {
    
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
    }
    
    func showDate(date: String) {
        DispatchQueue.main.async {
            self.mainView.dateLab.text = date
        }
    }
    
    func showTwo(two: Int) {
        DispatchQueue.main.async {
            self.mainView.two.text = two.description
        }
    }
    
    func tapSpace() {
        presenter?.didTapSpace()
    }
}
