//
//  SpaceCartView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit
import SDWebImage

class SpaceCartView: UIView {
    
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
    
    private lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.style = .large
        view.color = .systemMint
        return view
    }()
    
    private let imageName: String
    private let title: String
    
    init(image: String, title: String) {
        self.imageName = image
        self.title = title
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
        titleLab.text = title
    }
    
    private func initComponent() {
        backgroundColor = .white
        layer.cornerRadius = 26
        
        addSubview(imageView)
        addSubview(titleLab)
        addSubview(activityView)
        initConstraints()
    }
    
    private func initConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.bottom.equalTo(titleLab.snp.top).offset(-10)
        }
        
        activityView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.height.equalTo(50)
        }
        
        titleLab.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(30)
            make.bottom.equalToSuperview().inset(30)
        }
    }
}
