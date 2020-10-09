//
//  MenuDetailCell.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/27.
//

import UIKit

class MandatoryOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.text = "TEMPERATURE"
        return label
    }()
    
    private let selectedOption: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .purple
        label.text = "TEMPERATURE"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .purple
        label.text = "(+0원)"
        return label
    }()
    
    private lazy var leftButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("HOT", for: .normal)
        btn.backgroundColor = .white
        btn.tintColor = .purple
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.purple.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    private lazy var rightButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ICE", for: .normal)
        btn.backgroundColor = .purple
        btn.tintColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.purple.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

//        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK: - Selectors

}
