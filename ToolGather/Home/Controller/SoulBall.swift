//
//  SoulBall.swift
//  ToolGather
//
//  Created by 于浏洋 on 2023/8/1.
//

import Foundation
let SCREENWIDTH = UIScreen.main.bounds.width
let SCREENHEIGHT = UIScreen.main.bounds.height

class SoulBall: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame = CGRect.init(x: 10, y: (SCREENHEIGHT - SCREENWIDTH) / 2.0, width: SCREENWIDTH - 20, height: SCREENWIDTH)
        let sphereView = AASphereView.init(frame: frame)
        self.view.addSubview(sphereView)
        
        var tags = [UIView]()
        for i in 0..<50 {
            
            let button = UIButton.init()
            button.setTitle("aa\(i)", for: .normal)
            button.setTitleColor(UIColor.brown, for: .normal)
            button.addTarget(self, action: #selector(buttonAction(btn:)), for: .touchUpInside)
            button.sizeToFit()
            tags.append(button)
            
        }
        sphereView.setTagViews(array: tags)
        
    }
    
    @objc func buttonAction(btn: UIButton) {
        
        
    }

}

