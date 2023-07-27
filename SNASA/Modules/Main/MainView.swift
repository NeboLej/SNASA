//
//  MainView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit

class MainView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var todayLab: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        label.text = "TODAY"
        return label
    }()
    
    private lazy var nasaLab: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        label.textAlignment = .right
        label.text = "NASA"
        return label
    }()
    
    private lazy var lastWeekLab: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        label.text = "LAST WEEK"
        return label
    }()
    
    private lazy var lastWeekCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SpaceCell.self, forCellWithReuseIdentifier: SpaceCell.ID)
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    private lazy var todaySpaceView = SpaceCartView(image: "testImage", title: "test name")
    
    private lazy var scrollView = UIScrollView()
    private lazy var todayContainerView = UIView()
    private lazy var lastWeekContainerView = UIView()
    
    private var spaces: [SpaceEntity] = []

    override func layoutSubviews() {
        super.layoutSubviews()
        configureGradientLayer()
    }
    
    override func setViews() {
        super.setViews()
        
        todayContainerView.addSubview(todayLab)
        todayContainerView.addSubview(nasaLab)
        todayContainerView.addSubview(todaySpaceView)

        lastWeekContainerView.addSubview(lastWeekLab)
        lastWeekContainerView.addSubview(lastWeekCollectionView)

        scrollView.addSubview(todayContainerView)
        scrollView.addSubview(lastWeekContainerView)
        
        addSubview(scrollView)
    }
    
    //MARK: - Public methods
    func updateTodaySpaceView(imagePath: String, title: String) {
        todaySpaceView.changeImage(imagePath)
        todaySpaceView.changeTitle(title)
    }
    
    func updeteLastWeekSpaces(spaces: [SpaceEntity]) {
        self.spaces = spaces
        lastWeekCollectionView.reloadData()
    }
    
    private func configureGradientLayer(){
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
            make.edges.equalToSuperview()
        }

        todayContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.width.equalToSuperview().inset(20)
            make.leading.trailing.equalTo(scrollView).inset(20)
            make.bottom.equalTo(todaySpaceView)
        }

        lastWeekContainerView.snp.makeConstraints { make in
            make.top.equalTo(todayContainerView.snp.bottom).offset(50)
            make.left.right.equalTo(scrollView)
            make.bottom.equalTo(lastWeekCollectionView)
            make.bottom.equalTo(scrollView)
        }
        
        lastWeekLab.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(lastWeekContainerView).inset(20)
            make.height.equalTo(40)
        }
        
        lastWeekCollectionView.snp.makeConstraints { make in
            make.top.equalTo(lastWeekLab.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(270)
        }

        todayLab.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(todayContainerView)
        }

        nasaLab.snp.makeConstraints { make in
            make.trailing.equalTo(todayContainerView)
            make.centerY.equalTo(todayLab)
        }

        todaySpaceView.snp.makeConstraints { make in
            make.top.equalTo(todayLab.snp.bottom).offset(8)
            make.width.equalTo(todayContainerView)
            make.height.equalTo(300)
        }
    }
    
    
    //MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 240, height: 270)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        spaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpaceCell.ID, for: indexPath) as! SpaceCell
        cell.bind(space: spaces[indexPath.item])
        return cell
    }
}
