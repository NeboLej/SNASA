//
//  MainView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit

class MainView: BaseView {
    
    let dateLab: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "asasdasdadsasdd"
        return label
    }()
    
    let two: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.text = "asd"
        return label
    }()
    
    override func setViews() {
        super.setViews()
        addSubview(dateLab)
        addSubview(two)
        backgroundColor = .white
    }
    
    override func layoutViews() {
        super.layoutViews()
        dateLab.snp.makeConstraints { make in
            make.left.right.equalTo(10)
            make.top.equalTo(50)
            make.height.equalTo(100)
        }
        
        two.snp.makeConstraints { make in
            make.left.right.equalTo(10)
            make.top.equalTo(200)
            make.bottom.equalTo(50)
        }
        
    }
    
    
    
}
