//
//  ViewController.swift
//  LFSegmentView
//


import UIKit

class ViewController: UIViewController {

    var segmentV : LFSegmentView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataArray =  ["全部","系统","活动","积分","其他"]
        segmentV = LFSegmentView(num: dataArray.count)
        self.view.addSubview(segmentV!)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        segmentV?.translatesAutoresizingMaskIntoConstraints = false
        
        segmentV?.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        segmentV?.leftAnchor.constraint(equalTo: safeGuide.leftAnchor).isActive = true
        segmentV?.rightAnchor.constraint(equalTo: safeGuide.rightAnchor).isActive = true
        segmentV?.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        
        segmentV?.indexCallback = { index  in
            
            self.showCurrentIndexView(index: index)
        }
          segmentV?.updateWithData(arr: dataArray)
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showCurrentIndexView(index:Int){
        
        let view = self.segmentV?.viewWithTag(20180109 + index)
        
        if view != nil{
            
            return;
        }
        
    }


}

