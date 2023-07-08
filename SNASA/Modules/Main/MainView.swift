//
//  MainView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit

class MainView: BaseView {
    
    lazy var todayLab: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        label.text = "TODAY"
        return label
    }()
    
    lazy var nasaLab: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.textAlignment = .right
        label.text = "NASA"
        return label
    }()
    
    lazy var todaySpaceView = SpaceCartView(image: "testImage", title: "test name")
    
    let dateLab: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        return label
    }()
    
    let two: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureGradientLayer()
    }
    
    override func setViews() {
        super.setViews()
        addSubview(todayLab)
        addSubview(nasaLab)
        addSubview(todaySpaceView)
        addSubview(dateLab)
        addSubview(two)
    }
    
    func configureGradientLayer(){
        backgroundColor = .clear
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.systemMint.cgColor]
        gradient.locations = [0, 2]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        todayLab.snp.makeConstraints { make in
            make.left.equalTo(24)
            make.top.equalTo(safeAreaInsets.top + 80)
        }
        
        nasaLab.snp.makeConstraints { make in
            make.right.equalTo(-24)
            make.centerY.equalTo(todayLab.snp.centerY)
        }
        
        todaySpaceView.snp.makeConstraints { make in
            make.left.right.equalTo(24)
            make.right.equalTo(-24)
            make.top.equalTo(todayLab.snp.bottom).offset(8)
            make.height.equalTo(300)
        }
        
//        dateLab.snp.makeConstraints { make in
//            make.left.right.equalTo(10)
//            make.top.equalTo(50)
//            make.height.equalTo(100)
//        }
//
//        two.snp.makeConstraints { make in
//            make.left.right.equalTo(10)
//            make.top.equalTo(200)
//            make.bottom.equalTo(50)
//        }
        
    }
    
    
    
}
