//
//  BaseView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViews()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
    }
    
    func layoutViews() {
        
    }
}
