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
        
        tabBar.tintColor = .purple
        
        let home = HomeViewController()
        let nav1 = templateNavController(home, image: UIImage(named: "home_tabBar"))
        nav1.tabBarItem.title = "홈"
        
        let Bookmark = BookmarkViewController()
        let nav2 = templateNavController(Bookmark, image: UIImage(named: "heart_tabBar"))
        nav2.tabBarItem.title = "찜한 가게"
        
        let status = OrderStatusViewController()
        let nav3 = templateNavController(status, image: UIImage(named: "clock_tabBar"))
        nav3.tabBarItem.title = "주문 현황"
        
        let history = OrderHistoryViewController()
        let nav4 = templateNavController(history, image: UIImage(named: "doc_tabBar"))
        nav4.tabBarItem.title = "주문 내역"
        
        let myPage = MyPageViewController()
        let nav5 = templateNavController(myPage, image: UIImage(named: "myPage_tabBar"))
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

