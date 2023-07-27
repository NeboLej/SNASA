//
//  SpaceCell.swift
//  SNASA
//
//  Created by Nebo on 22.07.2023.
//

import UIKit
import SnapKit
import SDWebImage

class SpaceCell: UICollectionViewCell {
    
    static let ID = "SpaceCell"
    
    private lazy var imageView: SDAnimatedImageView = {
        let iv = SDAnimatedImageView()
        iv.layer.cornerRadius = 26
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: imageName)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var titleLab: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private var imageName: String = ""
    private var title: String = ""
    
    func bind(space: SpaceEntity) {
        imageView.sd_setImage(with: URL(string: space.url))
        titleLab.text = space.title
        initComponent()
    }
    
    private func initComponent() {
        backgroundColor = .white
        layer.cornerRadius = 26
        
        addSubview(imageView)
        addSubview(titleLab)
        initConstraints()
    }
    
    private func initConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.bottom.equalTo(titleLab.snp.top).offset(-10)
        }
        
        titleLab.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(30)
            make.bottom.equalToSuperview().inset(30)
        }
    }
}
