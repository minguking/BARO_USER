//
//  ViewController.swift
//  BARO-user
//
//  Created by Kang Mingu on 2020/09/23.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    
    // MARK: - Helper
    
    func configureViewControllers() {
        
        let home = HomeViewController()
        let nav1 = templateNavController(home, image: UIImage(named: "홈 off"))
        nav1.tabBarItem.image = UIImage(systemName: "house")
        nav1.tabBarItem.title = "홈"
        
        let Bookmark = BookmarkViewController()
        let nav2 = templateNavController(Bookmark, image: UIImage(named: "찜 off"))
        nav2.tabBarItem.image = UIImage(systemName: "heart")
        nav2.tabBarItem.title = "찜한 가게"
        
        let status = OrderStatusViewController()
        let nav3 = templateNavController(status, image: UIImage(named: "주문현황 off"))
        nav3.tabBarItem.image = UIImage(systemName: "clock")
        nav3.tabBarItem.title = "주문 현황"
        
        let history = OrderHistoryViewController()
        let nav4 = templateNavController(history, image: UIImage(named: "주문내역 off"))
        nav4.tabBarItem.image = UIImage(systemName: "doc.plaintext")
        nav4.tabBarItem.title = "주문 내역"
        
        let myPage = MyPageViewController()
        let nav5 = templateNavController(myPage, image: UIImage(named: "마이페이지 off"))
        nav5.tabBarItem.image = UIImage(systemName: "person")
        nav5.tabBarItem.title = "마이페이지"
        
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
        
    }
    
    func templateNavController(_ rootViewController: UIViewController, image: UIImage?) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
    }


}

