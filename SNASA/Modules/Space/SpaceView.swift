//
//  SpaceView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit
import SDWebImage

class SpaceView: BaseView {
    
    private lazy var dateLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var leftPointLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 40)
        label.textAlignment = .left
        label.text = ",,,"
        return label
    }()

    private lazy var rightPointLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 40)
        label.textAlignment = .right
        label.text = ",,,"
        return label
    }()
    
    private lazy var separatorView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.MyColor.darkSeparatorColor
        return view
    }()
    
    private lazy var imageView: SDAnimatedImageView = {
        let iv = SDAnimatedImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var titleLab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.lightTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 20)
        label.numberOfLines = 0
        addSubview(label)
        return label
    }()
    
    private lazy var titileBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.MyColor.titleBackgroundColor2
        return view
    }()
    
    private lazy var descLab: UILabel = {
        let textView = UILabel()
        textView.textColor = UIColor.MyColor.darkTextColor
        textView.font = UIFont(name: UIFont.MyFont.readTextBold, size: 20)
        textView.numberOfLines = 0
        return textView
    }()
    

    private lazy var headerContainerView = UIView()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    override func setupView() {
        super.setupView()
        backgroundColor = UIColor.MyColor.backgroundColor
    }
    
    func updateView(date: String, imagePath: String, desc: String, title: String) {
        dateLab.text = date
        descLab.text = desc
        titleLab.text = title
        imageView.sd_setImage(with: URL(string: imagePath)) { _, _, _, _ in
//            self.activityView.isHidden = true
        }
    }
    
    override func setViews() {
        super.setViews()
        
        headerContainerView.addSubview(dateLab)
        headerContainerView.addSubview(leftPointLab)
        headerContainerView.addSubview(rightPointLab)
        headerContainerView.addSubview(separatorView)
        addSubview(headerContainerView)
        
        scrollView.addSubview(titileBackgroundView)
        scrollView.addSubview(titleLab)
        scrollView.addSubview(imageView)
        scrollView.addSubview(descLab)
        
        addSubview(scrollView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        //HEADER
        headerContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(scrollView).inset(14)
            make.height.equalTo(60)
        }
        
        dateLab.snp.makeConstraints { make in
            make.center.equalTo(headerContainerView)
        }
        
        leftPointLab.snp.makeConstraints { make in
            make.bottom.equalTo(dateLab)
            make.leading.equalToSuperview()
        }
        
        rightPointLab.snp.makeConstraints { make in
            make.bottom.equalTo(dateLab)
            make.trailing.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(headerContainerView)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(headerContainerView.snp.bottom).offset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
        
        titleLab.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(imageView.snp.bottom).offset(16)
        }
        
        titileBackgroundView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(imageView)
            make.bottom.equalTo(titleLab.snp.bottom).offset(16)
        }
        
        descLab.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalTo(titileBackgroundView.snp.bottom).offset(10)
        }
    }
}
