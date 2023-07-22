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
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        label.text = "TODAY"
        return label
    }()
    
    lazy var nasaLab: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.textAlignment = .right
        label.text = "NASA"
        return label
    }()
    
    lazy var todaySpaceView = SpaceCartView(image: "testImage", title: "test name")
    
    lazy var todayContainerView = UIView()
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureGradientLayer()
    }
    
    override func setViews() {
        super.setViews()
        
        todayContainerView.addSubview(todayLab)
        todayContainerView.addSubview(nasaLab)
        todayContainerView.addSubview(todaySpaceView)
        
        contentView.addSubview(todayContainerView)
        
        scrollView.addSubview(contentView)
        
        addSubview(scrollView)
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
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.left.right.equalTo(self)
            make.bottom.equalTo(scrollView)
        }
        
        todayContainerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(60)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(2000)
            make.bottom.equalTo(scrollView)
        }

        todayLab.snp.makeConstraints { make in
            make.leading.equalTo(todayContainerView.snp.leading)
        }

        nasaLab.snp.makeConstraints { make in
            make.trailing.equalTo(todayContainerView.snp.trailing)
            make.centerY.equalTo(todayLab.snp.centerY)
        }

        todaySpaceView.snp.makeConstraints { make in
            make.top.equalTo(todayLab.snp.bottom).offset(8)
            make.width.equalTo(todayContainerView.snp.width)
            make.height.equalTo(300)
        }
    }
}
