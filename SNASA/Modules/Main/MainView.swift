//
//  MainView.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import UIKit
import SnapKit

class MainView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var nasaLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 40)
        label.textAlignment = .center
        label.text = "NASA"
        return label
    }()
    
    private lazy var separatorView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.MyColor.darkSeparatorColor
        return view
    }()
    
    private lazy var dateLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartRegular, size: 14)
        label.textAlignment = .right
        label.text = Date().toSimpleDate()
        return label
    }()
    
    private lazy var pointLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 40)
        label.textAlignment = .left
        label.text = ",,,"
        return label
    }()
    
    private lazy var lastWeekLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 25)
        label.textAlignment = .left
        label.text = "LAST WEEK"
        return label
    }()
    
    private lazy var separatorlastWeekView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.MyColor.darkSeparatorColor
        return view
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
    private lazy var headerContainerView = UIView()
    private lazy var lastWeekContainerView = UIView()
    
    private var spaces: [SpaceEntity] = []

    override func setViews() {
        super.setViews()

        backgroundColor = UIColor.MyColor.backgroundColor
        
        headerContainerView.addSubview(nasaLab)
        headerContainerView.addSubview(dateLab)
        headerContainerView.addSubview(pointLab)
        headerContainerView.addSubview(separatorView)

        lastWeekContainerView.addSubview(lastWeekLab)
        lastWeekContainerView.addSubview(separatorlastWeekView)
        lastWeekContainerView.addSubview(lastWeekCollectionView)

        scrollView.addSubview(headerContainerView)
        scrollView.addSubview(todaySpaceView)
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
    
    override func layoutViews() {
        super.layoutViews()
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //HEADER
        headerContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalTo(scrollView).inset(14)
            make.height.equalTo(60)
        }
        
        nasaLab.snp.makeConstraints { make in
            make.center.equalTo(headerContainerView)
        }
        
        dateLab.snp.makeConstraints { make in
            make.bottom.equalTo(nasaLab)
            make.trailing.equalToSuperview()
        }
        
        pointLab.snp.makeConstraints { make in
            make.bottom.equalTo(nasaLab)
            make.leading.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(headerContainerView)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        //TodaySpaceView
        todaySpaceView.snp.makeConstraints { make in
            make.top.equalTo(headerContainerView.snp.bottom).offset(10)
            make.width.equalToSuperview().inset(14)
            make.leading.trailing.equalTo(scrollView).inset(14)
            make.height.equalTo(300)
        }
        //LAST WEEK
        lastWeekContainerView.snp.makeConstraints { make in
            make.top.equalTo(todaySpaceView.snp.bottom).offset(30)
            make.left.right.equalTo(scrollView)
            make.bottom.equalTo(lastWeekCollectionView)
            make.bottom.equalTo(scrollView)
        }
        
        lastWeekLab.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(lastWeekContainerView).inset(20)
            make.height.equalTo(40)
        }
        
        separatorlastWeekView.snp.makeConstraints { make in
            make.leading.equalTo(lastWeekLab.snp.trailing).offset(4)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(lastWeekLab).inset(12)
            make.height.equalTo(1)
        }
        
        lastWeekCollectionView.snp.makeConstraints { make in
            make.top.equalTo(lastWeekLab.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(270)
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
