//
//  SearchView.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import UIKit
import SnapKit

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
                make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(isShow ? 40 : 0)
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
        
        searchContainerView.addArrangedSubview(datePicker)
        searchContainerView.addArrangedSubview(getButton)
        
        addSubview(searchButton)
        addSubview(searchContainerView)
        addSubview(scrollView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.bottom.equalTo(searchContainerView.snp.top)
        }
        
        searchContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(40)
            make.height.equalTo(0)
        }
        
        getButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
        }
    }
}
