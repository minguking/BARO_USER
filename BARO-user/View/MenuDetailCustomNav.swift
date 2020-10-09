//
//  MenuDetailCustomNav.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/27.
//

import UIKit

protocol MenuDetailCustomNavDelegate: class {
    func backButtonTapped()
}

class MenuDetailCustomNav: UIView {

    // MARK: - Properties
    
    weak var delegate: MenuDetailCustomNavDelegate?
    
    private let titleKorean: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "비엔나 커피"
        return label
    }()
    
    private let titleEnglish: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "Vienna coffee"
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setDimensions(width: 16, height: 16)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var underLine: UIView = {
        let view = UIView()
//        view.setDimensions(width: frame.width, height: 2)
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleKorean)
        addSubview(titleEnglish)
        addSubview(backButton)
        addSubview(underLine)
        
        titleKorean.centerX(inView: self)
        titleKorean.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 4)
        titleEnglish.centerX(inView: self)
        titleEnglish.anchor(top: titleKorean.bottomAnchor, paddingTop: 4)
        backButton.anchor(left: leftAnchor, paddingLeft: 20)
        backButton.centerYAnchor.constraint(equalTo: titleKorean.centerYAnchor).isActive = true
        underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                         width: frame.width, height: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Selectors
    
    @objc func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
}
