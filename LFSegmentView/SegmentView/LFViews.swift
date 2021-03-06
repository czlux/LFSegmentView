//
//  LFViews.swift
//  LFSegmentView
//


import Foundation
import UIKit
class SegmentCell:UICollectionViewCell{
    var label:UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        label?.textAlignment = .center
        label?.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(label!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LFSegmentView:UIView,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var topView:UICollectionView?
    
    var containerView:UIScrollView?
    var dataArray:[String] = Array()
    
    var currentIndex = 0
    var layout = UICollectionViewFlowLayout()
    
    var indexCallback:(Int)->() = {(index) in }
    
    private override init(frame: CGRect) {
        
        super.init(frame: frame)
        containerView = UIScrollView()
        containerView?.isPagingEnabled = true
        containerView?.tag = 10
        containerView?.delegate = self
        self.addSubview(containerView!)
        
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .horizontal
        
    
        topView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        topView?.delegate = self
        topView?.dataSource  = self
        topView?.showsHorizontalScrollIndicator = false
        topView?.alwaysBounceHorizontal = true
        topView?.backgroundColor = UIColor.clear
        topView?.register(SegmentCell.self, forCellWithReuseIdentifier: "SegmentCell")
        self.addSubview(topView!)
    }
    convenience init(num:Int) {
        self.init(frame: CGRect.zero)
        
    }
    
    func updateWithData(arr:[String]){
        
        self.dataArray = arr
        self.indexCallback(0)
        self.topView?.reloadData()
    }
    
    override func layoutSubviews() {
       
        topView?.frame = CGRect(x: 0, y: 0, width: self.width, height: 40)
        containerView?.frame = CGRect(x: 0, y: 40, width: self.width, height: self.height - 40)
      
        let itemCount = self.dataArray.count < 5 ? self.dataArray.count : 4
        let sapce = CGFloat(itemCount * 1)
        layout.itemSize = CGSize(width: (self.width - 20 - sapce) / CGFloat(itemCount), height: 40)
        containerView?.contentSize = CGSize(width: self.width * CGFloat(self.dataArray.count), height: self.height - 40)
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentCell", for: indexPath) as! SegmentCell
        
        cell.label?.text = self.dataArray[indexPath.item]
        cell.label?.textColor = self.currentIndex == indexPath.item ? UIColor.orange : UIColor.black
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentIndex = indexPath.item
        collectionView.reloadData()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        changeScrollViewContentOffSet()
        self.indexCallback(self.currentIndex)
        
    }
    func changeScrollViewContentOffSet(){
        
        self.containerView?.setContentOffset(CGPoint(x: self.width * CGFloat(self.currentIndex), y: 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 10{
            let index = Int(scrollView.contentOffset.x / self.width)
            self.currentIndex = index
            self.topView?.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            self.topView?.reloadData()
            self.indexCallback(self.currentIndex)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
