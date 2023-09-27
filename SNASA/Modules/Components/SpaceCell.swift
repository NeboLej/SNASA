//
//  SpaceCell.swift
//  SNASA
//
//  Created by Nebo on 22.07.2023.
//

import UIKit
import SnapKit
import SDWebImage

final class SpaceCell: UICollectionViewCell {
    
    static let ID = "SpaceCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var imageView: SDAnimatedImageView = {
        let iv = SDAnimatedImageView()
        iv.image = UIImage(named: imageName)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var titleLab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 20)
        label.text = title.uppercased()
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descLab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartItalic, size: 14)
        label.text = desc
        label.numberOfLines = 3
        label.textAlignment = .left
        return label
    }()
    
    private lazy var pointLab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 25)
        label.text = "..."
        label.textAlignment = .left
        return label
    }()
    
    private lazy var dateLab: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartRegular, size: 12)
        label.text = date
        label.textAlignment = .right
        return label
    }()
    
    private var imageName: String = ""
    private var title: String = ""
    private var desc: String = ""
    private var date: String = ""
    
    func bind(space: SpaceEntity) {
        imageView.sd_setImage(with: URL(string: space.url))
        titleLab.text = space.title.uppercased()
        descLab.text = space.explanation
        dateLab.text = space.date
        initComponent()
    }
    
    private func initComponent() {
        backgroundColor = UIColor.MyColor.backgroundColor
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.black.cgColor
        
        
        containerView.addSubview(titleLab)
        containerView.addSubview(imageView)
        containerView.addSubview(descLab)
        
        addSubview(dateLab)
        addSubview(pointLab)
        
        addSubview(containerView)
        
        initConstraints()
    }
    
    private func initConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(7)
            make.bottom.equalTo(dateLab.snp.top).offset(-5) 
            make.leading.trailing.equalToSuperview().inset(5)
        }
        
        titleLab.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(8)
            make.height.equalTo(42)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLab.snp.bottom).offset(10)
        }
        
        descLab.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
            make.height.equalTo(60)
        }
        
        dateLab.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(8)
        }
        
        pointLab.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(8)
        }
    }
}
