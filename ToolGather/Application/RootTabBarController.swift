//
//  RootTabBarController.swift
//  SwiftDemo
//
//  Created by sam   on 2020/4/7.
//  Copyright © 2020 sam  . All rights reserved.
//

import UIKit
import ESTabBarController_swift

class RootTabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        creatSubViewControllers()
    }
    
    func setupUI(){
        
        let color: UIColor = UIColor.hexColor("0x000000")!
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : color], for: UIControl.State.selected)
        self.tabBar.barTintColor = .darkGray
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundColor = .white
        
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowRadius = 5
    }
    
    func creatSubViewControllers(){
        let vc1  = HomeViewController ()
        let navc1 = RootNavigationViewController(rootViewController: vc1)
        
        let item1 : UITabBarItem = UITabBarItem (title: "首页", image: UIImage(systemName: "house")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), selectedImage: UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black))
        navc1.tabBarItem = item1
        
        let vc2 = MineViewController()
        let navc2 = RootNavigationViewController(rootViewController: vc2)
        let item2 : UITabBarItem = UITabBarItem (title: "喜欢", image: UIImage(systemName: "heart.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), selectedImage: UIImage(systemName: "heart.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black))
        navc2.tabBarItem = item2
        
        let vc3 = MineViewController()
        let navc3 = RootNavigationViewController(rootViewController: vc3)
        let item3 : UITabBarItem = UITabBarItem (title: "消息", image: UIImage(systemName: "bell.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), selectedImage: UIImage(systemName: "bell.circle.fill")?.withRenderingMode( .alwaysOriginal).withTintColor(.black))
        navc3.tabBarItem = item3
        
        let vc4 = MineViewController()
        let navc4 = RootNavigationViewController(rootViewController: vc4)
        let item4 : UITabBarItem = UITabBarItem (title: "新增", image: UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), selectedImage: UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black))
        navc4.tabBarItem = item4
        
        let vc5 = MineViewController()
        let navc5 = RootNavigationViewController(rootViewController: vc5)
        let item5 : UITabBarItem = UITabBarItem (title: "日程", image: UIImage(systemName: "clock")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), selectedImage: UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black))
        navc5.tabBarItem = item5
        
        let vc6 = MineViewController()
        let navc6 = RootNavigationViewController(rootViewController: vc6)
        let item6 : UITabBarItem = UITabBarItem (title: "我的", image: UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), selectedImage: UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black))
        navc6.tabBarItem = item6
        
        let tabArray = [navc1, navc2, navc3, navc4, navc5, navc6]
        self.viewControllers = tabArray
    }
}
