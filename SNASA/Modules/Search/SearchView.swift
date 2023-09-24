//
//  SearchView.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import UIKit
import SnapKit
import SDWebImage

final class SearchView: BaseView {
    
    private lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .date
        dp.date = Date()
        dp.layer.borderWidth = 1
        dp.layer.borderColor = UIColor.black.cgColor
        dp.preferredDatePickerStyle = .inline
        return dp
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        let attr = NSMutableAttributedString(string: "Get", attributes: [NSAttributedString.Key.font: UIFont(name: UIFont.MyFont.standartRegular, size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.MyColor.darkTextColor!])
        button.setAttributedTitle(attr, for: .normal)
        button.backgroundColor = UIColor.MyColor.backgroundColor
        button.addTarget(self, action: #selector(onGet), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchContainerView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = UIColor.MyColor.titleBackgroundColor
        return view
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor.MyColor.titleBackgroundColor
        button.tintColor = UIColor.MyColor.backgroundColor
        button.addTarget(self, action: #selector(onSearch), for: .touchUpInside)
        return button
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
    
    private lazy var pointLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.darkTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 45)
        label.textAlignment = .center
        label.text = "..."
        return label
    }()
    
    private lazy var descLab: UILabel = {
        let textView = UILabel()
        textView.textColor = UIColor.MyColor.darkTextColor
        textView.font = UIFont(name: UIFont.MyFont.readText, size: 20)
        textView.numberOfLines = 0
        return textView
    }()
    
    //Action
    @objc func onSearch( _ sender: Any ) {
        toggleCalendarView(isShow: true)
    }
    
    @objc func onGet(_ sender: Any ) {
        toggleCalendarView(isShow: false)
    }
    
    private func toggleCalendarView(isShow: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.searchContainerView.snp.updateConstraints { make in
                make.height.equalTo(isShow ? UIScreen.main.bounds.height/2 : 0)
                make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(isShow ? 0 : 100)
            }
            self.layoutIfNeeded()
        }
    }
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = UIColor.MyColor.backgroundColor
    }
    
    override func setViews() {
        super.setViews()
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLab)
        scrollView.addSubview(titileBackgroundView)
        scrollView.addSubview(pointLab)
        scrollView.addSubview(descLab)
        
        searchContainerView.addArrangedSubview(datePicker)
        searchContainerView.addArrangedSubview(getButton)
        
        addSubview(scrollView)
        addSubview(searchButton)
        addSubview(searchContainerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        //CONTENT
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
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

        pointLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titileBackgroundView.snp.bottom).offset(4)
        }

        descLab.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalTo(pointLab.snp.bottom).offset(-16)
        }
        
        //SEARCH
        searchContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(100)
            make.height.equalTo(0)
        }
        
//        getButton.snp.makeConstraints { make in
//            make.height.equalTo(40)
//        }
        
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
        }
    }
}
