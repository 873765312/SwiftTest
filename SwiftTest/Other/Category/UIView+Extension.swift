//
//  UIView+Extension.swift
//  SwiftTest
//
//  Created by 张路平 on 2017/11/28.
//  Copyright © 2017年 张路平. All rights reserved.
//

import Foundation
import UIKit


// MARK: - 增加是否在当前显示的窗口
extension UIView {
    public func isShowingKeyWindow() -> Bool {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            
            return false
        }
        
        //以主窗口的左上角为原点,计算self的矩形框（谁调用这个方法self就是谁）
        let frame = keyWindow.convert(self.frame, from: self.superview)
        
        //判断主窗口的bounds和self的范围是否有重叠
        let isIntersects = frame.intersects(keyWindow.bounds)
        return isIntersects && !self.isHidden && self.alpha > 0  && self.window == keyWindow
    }
}


// MARK: - 获取view的上下左右中心点
extension UIView {
    
    // x
    var lp_x: CGFloat {
        
        get {
            return frame.origin.x
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
        
    }
    
    // y
    var lp_y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // height
    var lp_height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
            
        }
    }
    
    // width
    var lp_width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    //  left
    var lp_left: CGFloat {
        get {
            return lp_x
        }
        set {
            lp_x = newValue
        }
    }
    
    // right
    var lp_right: CGFloat {
        get {
            return lp_x + lp_width
        }
        set {
            lp_x = newValue - lp_width
        }
    }
    
    // bottom
    var lp_bottom: CGFloat {
        get {
            return lp_y + lp_height
        }
        set {
            lp_y = newValue - lp_height
        }
    }
    
    // 自身中心点
    var lp_center: CGPoint {
        get {
            return CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
        }
        set {
            center = CGPoint(x: newValue.x, y:newValue.y)
        }
    }
    
    // 中心点x
    var lp_centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    //中心点y
    var lp_centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center = CGPoint(x: center.x, y:newValue)
        }
    }
    
    
}


