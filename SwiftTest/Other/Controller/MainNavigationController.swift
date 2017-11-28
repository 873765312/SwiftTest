//
//  MainNavigationController.swift
//  SwiftTest
//
//  Created by 张路平 on 2017/11/28.
//  Copyright © 2017年 张路平. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage(named:"navigationbarBackgroundWhite"), for: .default)
        
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            let button = UIButton(type: .custom)
            button.setTitle("返回", for: .normal)
            button.setImage(UIImage(named: "navigationButtonReturn"), for: .normal)
            button.setImage(UIImage(named: "navigationButtonReturnClick"), for: .highlighted)
            button.addTarget(self, action: #selector(back), for: .touchUpInside)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.setTitleColor(UIColor.red, for: .highlighted)
            button.sizeToFit()
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
            button.contentHorizontalAlignment = .left
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
            viewController.hidesBottomBarWhenPushed = true
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//mark: - 点击事件
extension MainNavigationController {
    @objc func back() {
        popViewController(animated: true)
    }
}

// mark: - 设置全屏pop手势
extension MainNavigationController {
    fileprivate func setUpPopGestrue() {
        //使用运行时,打印手势中所有属性
        guard let targets = interactivePopGestureRecognizer!.value(forKey: "_targets") as? [NSObject] else { return }
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        let  panGes = UIPanGestureRecognizer.init(target: target, action: action)
        view.addGestureRecognizer(panGes)
        
        
        
        
    }
    
}
