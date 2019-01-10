//
//  Extension.swift
//  LFSegmentView
//
//  Created by YLW on 2019/1/10.
//  Copyright © 2019 深圳易路网科技有限公司. All rights reserved.
//

import Foundation
import UIKit

let kwidth = UIScreen.main.bounds.width
let kheight = UIScreen.main.bounds.height

extension UIView{
    
    var height:CGFloat{
        get {
            return self.bounds.size.height
        }
        set {
            var rect = self.frame as CGRect
            rect.size.height = height
            self.frame = rect
        }
        
    }
    
    var width:CGFloat{
        get {
            return self.bounds.size.width
        }
        set {
            var rect = self.frame as CGRect
            rect.size.width = width
            self.frame = rect
        }
    }
    
    var top:CGFloat{
        
        get {
            return self.frame.origin.y
        }
        set {
            var rect = self.frame as CGRect
            rect.origin.y = top
        }
    }
}
