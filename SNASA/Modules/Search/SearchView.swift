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
    
    private lazy var headerContainerView = UIView()
    
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
        let attr = NSMutableAttributedString(string: "Get", attributes: [NSAttributedString.Key.font: UIFont(name: UIFont.MyFont.standartRegular, size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.MyColor.lightTextColor!])
        button.setAttributedTitle(attr, for: .normal)
        button.backgroundColor = UIColor.MyColor.titleBackgroundColor2
        button.addTarget(self, action: #selector(onGet), for: .touchUpInside)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        let attr = NSMutableAttributedString(string: "Cancel", attributes: [NSAttributedString.Key.font: UIFont(name: UIFont.MyFont.standartRegular, size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.MyColor.lightTextColor!])
        button.setAttributedTitle(attr, for: .normal)
        button.backgroundColor = UIColor.MyColor.titleBackgroundColor2
        button.addTarget(self, action: #selector(onCancel), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
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
    
    private lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.isHidden = true
        view.style = .large
        view.color = UIColor.MyColor.backgroundColor
        return view
    }()
    
    private lazy var infoLab: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.MyColor.lightTextColor
        label.font = UIFont(name: UIFont.MyFont.standartBold, size: 30)
        label.textAlignment = .center
        label.text = "Select date"
        return label
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
        label.isHidden = true
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
 
    var searchListener: SearchListenerProtocol?
    
    //Action
    @objc func onSearch( _ sender: Any ) {
        toggleCalendarView(isShow: true)
    }
    
    @objc func onCancel( _ sender: Any ) {
        toggleCalendarView(isShow: false)
    }
    
    @objc func onGet(_ sender: Any ) {
        infoLab.isHidden = true
        activityView.isHidden = false
        searchListener?.search(date: datePicker.date)
    }
    
    private func toggleCalendarView(isShow: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.buttonStack.snp.updateConstraints { make in
                make.height.equalTo(isShow ? 40 : 0)
            }
            self.searchContainerView.snp.updateConstraints { make in
                make.height.equalTo(isShow ? UIScreen.main.bounds.height/2 : 0)
            }
            self.layoutIfNeeded()
        }
    }
    
    func updateSpace( label: String, imagePath: String, desc: String, date: String) {
        titleLab.text = label
        descLab.text = desc
        dateLab.text = date
        pointLab.isHidden = false
        toggleCalendarView(isShow: false)
        imageView.sd_setImage(with: URL(string: imagePath)) { _, _, _, _ in
            self.activityView.isHidden = true
        }
    }
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = UIColor.MyColor.backgroundColor
    }
    
    override func setViews() {
        super.setViews()
        
        headerContainerView.addSubview(dateLab)
        headerContainerView.addSubview(leftPointLab)
        headerContainerView.addSubview(rightPointLab)
        headerContainerView.addSubview(separatorView)
        addSubview(headerContainerView)
        
        scrollView.addSubview(titileBackgroundView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(activityView)
        scrollView.addSubview(infoLab)
        scrollView.addSubview(titleLab)
        scrollView.addSubview(pointLab)
        scrollView.addSubview(descLab)
        
        buttonStack.addArrangedSubview(getButton)
        buttonStack.addArrangedSubview(cancelButton)
        
        searchContainerView.addArrangedSubview(datePicker)
        searchContainerView.addArrangedSubview(buttonStack)
        
        addSubview(scrollView)
        addSubview(searchButton)
        addSubview(searchContainerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        //HEADER
        headerContainerView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
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
        
        //CONTENT
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerContainerView.snp.bottom).offset(10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }

        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
        
        activityView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.height.equalTo(50)
        }
        
        infoLab.snp.makeConstraints { make in
            make.center.equalTo(imageView)
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
            make.top.equalTo(pointLab.snp.bottom).offset(10)
        }
        
        //SEARCH
        searchContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(UIScreen.main.bounds.height/2)
        }
        
        buttonStack.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
        }
    }
}
