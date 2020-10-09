//
//  MenuDetailOpenClose.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/27.
//

import UIKit

class MenuDetailHeaderBar: UIView {

    // MARK: - Properties
    
    private let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "필수옵션"
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(underLine)
        addSubview(label)
        
//        underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 20,
//                         paddingRight: 20, width: frame.width, height: 1)
        label.anchor(left: leftAnchor, paddingLeft: 12)
        label.centerY(inView: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
