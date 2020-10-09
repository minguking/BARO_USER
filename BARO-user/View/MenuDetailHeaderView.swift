//
//  MenuDetailHeaderView.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/27.
//

import UIKit

protocol MenuDetailHeaderDelegate: class {
    func hotButtonTapped()
    func iceButtonTapped()
    func plusButtonTapped()
    func minusButtonTapped()
}

class MenuDetailHeaderView: UIView {

    // MARK: - Properties
    
    weak var delegate: MenuDetailHeaderDelegate?
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(width: 120, height: 120)
        iv.layer.cornerRadius = 120 / 2
        iv.image = UIImage(systemName: "cart")
        iv.backgroundColor = .green
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
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
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .purple
        label.text = "5,800원"
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        button.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    
    private lazy var quantity = 1
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .purple
        label.text = "1"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("따뜻하게", for: .normal)
        button.backgroundColor = .purple
        button.tintColor = .white
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(hotTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var iceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("차갑게", for: .normal)
        button.backgroundColor = .white
        button.tintColor = .purple
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(iceTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Selectors
    
    @objc func minusTapped() {
        delegate?.minusButtonTapped()
        if quantity >= 2 {
            quantity -= 1
            quantityLabel.text = String(quantity)
        }
    }
    
    @objc func plusTapped() {
        delegate?.plusButtonTapped()
        quantity += 1
        quantityLabel.text = String(quantity)
    }
    
    @objc func hotTapped() {
        delegate?.hotButtonTapped()
    }
    
    @objc func iceTapped() {
        delegate?.iceButtonTapped()
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        let stack = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        stack.axis = .horizontal
        stack.spacing = 2
        stack.distribution = .fillEqually
        
        let buttonStack = UIStackView(arrangedSubviews: [hotButton, iceButton])
        buttonStack.spacing = 20
        buttonStack.distribution = .fillEqually
        
        addSubview(imageView)
        addSubview(titleKorean)
        addSubview(titleEnglish)
        addSubview(priceLabel)
        addSubview(stack)
//        addSubview(buttonStack)
        
        imageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 20)
        titleKorean.anchor(top: topAnchor, left: imageView.rightAnchor, paddingTop: 30, paddingLeft: 30)
        titleEnglish.anchor(top: titleKorean.bottomAnchor, left: imageView.rightAnchor, paddingLeft: 30)
        priceLabel.anchor(top: titleEnglish.bottomAnchor, left: imageView.rightAnchor,
                          paddingTop: 8, paddingLeft: 30)
        stack.anchor(top: priceLabel.bottomAnchor, left: imageView.rightAnchor,
                     paddingTop: 8, paddingLeft: 30)
//        buttonStack.anchor(top: imageView.bottomAnchor, paddingTop: 30, width: 300, height: 38)
//        buttonStack.centerX(inView: self)
        
    }
}
