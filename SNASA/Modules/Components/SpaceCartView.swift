//
//  SpaceCartView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit

class SpaceCartView: UIView {
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
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
    
    private lazy var progressBar: UIProgressView = {
        let view = UIProgressView()
        view.progressTintColor = .systemMint
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
    
    func changeImage(_ image: UIImage?) {
        imageView.image = image
    }
    func changeTitle(_ title: String) {
        titleLab.text = title
    }
    
    func changeProgress(_ progress: Double) {
        progressBar.progress = Float(progress)
        progressBar.isHidden = progress == 1.0
    }
    
    private func initComponent() {
        backgroundColor = .white
        layer.cornerRadius = 26
        
        addSubview(imageView)
        addSubview(titleLab)
        addSubview(progressBar)
        initConstraints()
    }
    
    private func initConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.bottom.equalTo(titleLab.snp.top).offset(-10)
        }
        
        progressBar.snp.makeConstraints { make in
            make.bottom.equalTo(imageView)
            make.left.right.equalTo(imageView).inset(15)
            make.height.equalTo(5)
        }
        
        titleLab.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(30)
            make.bottom.equalToSuperview().inset(30)
        }
        
    }
    
}
