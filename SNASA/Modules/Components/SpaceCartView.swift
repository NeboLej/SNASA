//
//  SpaceCartView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit
import SDWebImage

final class SpaceCartView: UIView {
    
    private lazy var imageView: SDAnimatedImageView = {
        let iv = SDAnimatedImageView()
        iv.image = UIImage(named: imageName)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        addSubview(iv)
        return iv
    }()
    
    private lazy var titleLab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.lightTextColor
        label.text = title
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 20)
        label.numberOfLines = 2
        addSubview(label)
        return label
    }()
    
    private lazy var pointLab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.lightTextColor
        label.text = "..."
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 40)
        addSubview(label)
        return label
    }()
    
    private lazy var todaylab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.lightTextColor
        label.text = "TODAY"
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 40)
        addSubview(label)
        return label
    }()
    
    private lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.style = .large
        view.color = UIColor.MyColor.backgroundColor
        addSubview(view)
        return view
    }()
    
    private let imageName: String
    private let title: String
    
    init(image: String, title: String) {
        self.imageName = image
        self.title = title.uppercased()
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        initComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeImage(_ imagePath: String) {
        self.imageView.sd_setImage(with: URL(string: imagePath)) { _, _, _, _ in
            self.activityView.isHidden = true
        }
    }
    
    func changeTitle(_ title: String) {
        titleLab.text = title.uppercased()
    }
    
    private func initComponent() {
        backgroundColor = UIColor.MyColor.titleBackgroundColor
        
        initConstraints()
    }
    
    private func initConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.bottom.equalTo(titleLab.snp.top).offset(-8)
        }
        
        todaylab.snp.makeConstraints { make in
            make.right.left.equalTo(10)
            make.bottom.equalTo(imageView.snp.bottom).offset(-16)
        }
        
        pointLab.snp.makeConstraints { make in
            make.right.equalTo(-8)
            make.bottom.equalToSuperview().inset(4)
        }
        
        titleLab.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-40)
            make.bottom.equalToSuperview().inset(24)
        }
        
        activityView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.height.equalTo(50)
        }
    }
}
