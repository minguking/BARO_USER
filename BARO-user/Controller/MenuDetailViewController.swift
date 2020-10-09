//
//  MenuDetailTableViewController.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/27.
//

import UIKit

private let mandatoryCellIdentifier = "MandatoryCell"
private let personalCellIdentifier = "PersonalCell"

class MenuDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var customNav = MenuDetailCustomNav(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 93))
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private lazy var quantity = 1
    
    private lazy var cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("장바구니 담기", for: .normal)
        button.backgroundColor = .purple
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddCart), for: .touchUpInside)
        return button
    }()
    
    var titles = [
        ["abc", "aef", "aff"],
        ["bbb", "bac", "bfz"],
        ["cfe", "cma", "cnp"]
    ]
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func handleAddCart() {
        print("DEBUG: Quantity is \(quantity)")
    }
    
    @objc func handleButtonTapped() {
        print("Make expandable cell")
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MandatoryOptionCell.self, forCellReuseIdentifier: mandatoryCellIdentifier)
        tableView.register(PersonalOptionCell.self, forCellReuseIdentifier: personalCellIdentifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        customNav.delegate = self
        
        view.addSubview(customNav)
        view.addSubview(tableView)
        view.addSubview(cartButton)
        
        customNav.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         width: view.frame.width, height: 93)
        cartButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.rightAnchor, width: view.frame.width, height: 56)
        tableView.anchor(top: customNav.bottomAnchor, left: view.leftAnchor,
                         bottom: cartButton.topAnchor, right: view.rightAnchor)
    }
    
}
// MARK: - UITableViewDataSource

extension MenuDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: return UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: mandatoryCellIdentifier,
                                                     for: indexPath) as! MandatoryOptionCell
            
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: personalCellIdentifier,
                                                     for: indexPath) as! PersonalOptionCell
            
            return cell
        default: return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        switch section {
        case 0:
            let header = MenuDetailHeaderView()
            header.delegate = self
//            header.backgroundColor = .green
            return header
        case 1:
            let view = MenuDetailHeaderBar()
            view.backgroundColor = .systemGroupedBackground
            return view
        case 2:
            let view = MenuDetailHeaderBar()
            view.label.text = "퍼스널옵셜"
            view.backgroundColor = .systemGroupedBackground
            return view
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 140
        } else {
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 0
        case 1: return 100
        case 2: return 80
        default: return 0
        }
    }
    
}


extension MenuDetailViewController: UITableViewDelegate {
    
}


// MARK: - MenuDetailCustomNavDelegate

extension MenuDetailViewController: MenuDetailCustomNavDelegate {
    
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}


// MARK: - MenuDetailHeaderDelegate

extension MenuDetailViewController: MenuDetailHeaderDelegate {
    func hotButtonTapped() {
        print("Hot")
    }
    
    func iceButtonTapped() {
        print("ice")
    }
    
    func plusButtonTapped() {
        print("plus")
        quantity += 1
    }
    
    func minusButtonTapped() {
        if quantity >= 2 {
            print("minus")
            quantity -= 1
        }
    }
    
    
}
