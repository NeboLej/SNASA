//
//  BaseViewController.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

class BaseViewController<V: BaseView>: UIViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func loadView() {
        super.loadView()
        view = V()
    }
    
    var mainView: V {
        return view as! V
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
