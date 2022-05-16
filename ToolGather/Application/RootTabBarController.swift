//
//  RootTabBarController.swift
//  SwiftDemo
//
//  Created by sam   on 2020/4/7.
//  Copyright © 2020 sam  . All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        creatSubViewControllers()
    }
    
    func setupUI(){
        
        let color: UIColor = UIColor.hexColor("0x000000")!
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : color], for: UIControl.State.selected)
        self.tabBar.barTintColor = .darkGray
    }
    
    func creatSubViewControllers(){
        let vc1  = HomeViewController ()
        let navc1 = RootNavigationViewController(rootViewController: vc1)
        
        let item1 : UITabBarItem = UITabBarItem (title: "首页", image: UIImage(named: "house")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "house.fill")?.withRenderingMode(.alwaysOriginal))
        navc1.tabBarItem = item1
        
        let vc2 = MineViewController()
        let navc2 = RootNavigationViewController(rootViewController: vc2)
        let item2 : UITabBarItem = UITabBarItem (title: "我的", image: UIImage(named: "person.circle")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "person.circle.fill")?.withRenderingMode(.alwaysOriginal))
        navc2.tabBarItem = item2
        
        let tabArray = [navc1, navc2]
        self.viewControllers = tabArray
    }
}
