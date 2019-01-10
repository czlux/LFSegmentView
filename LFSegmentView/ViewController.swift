//
//  ViewController.swift
//  LFSegmentView
//
//  Created by YLW on 2019/1/10.
//  Copyright © 2019 深圳易路网科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segmentV : LFSegmentView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        segmentV = LFSegmentView(frame: CGRect(x: 0, y: safeAreaBarHeight(), width: kwidth, height: kheight - safeAreaBarHeight() - safeAreaBottomHeight()), data: ["全部","系统","活动","积分","其他"])
        self.view.addSubview(segmentV!)
        
        segmentV?.indexCallback = { index  in
            
            self.showCurrentIndexView(index: index)
        }
        segmentV?.firstClick()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showCurrentIndexView(index:Int){
        
        let view = self.segmentV?.viewWithTag(20180109 + index)
        
        if view != nil{
            
            return;
        }
        
    }


}

