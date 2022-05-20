//
//  YLYPageViewCell.swift
//  ToolGather
//
//  Created by 于浏洋 on 2022/5/20.
//

import UIKit
import FSPagerView
import SnapKit
import Kingfisher

class YLYPageViewStyleOneCell: UITableViewCell{
    
    var pageViews : FSPagerView!
    var pageControl : FSPageControl!
    fileprivate let images = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
    fileprivate let transformerNames = ["cross fading", "zoom out", "depth", "linear", "overlap", "ferris wheel", "inverted ferris wheel", "coverflow", "cubic"]

    var transformType : FSPagerViewTransformerType?{
        didSet{
            pageViews.transformer = FSPagerViewTransformer(type:transformType ?? .crossFading)
            switch transformType {
            case .crossFading, .zoomOut, .depth:
                self.pageViews.itemSize = FSPagerView.automaticSize
                self.pageViews.decelerationDistance = 1
            case .linear, .overlap:
                let transform = CGAffineTransform(scaleX: 0.6, y: 0.75)
                self.pageViews.itemSize = self.pageViews.frame.size.applying(transform)
                self.pageViews.decelerationDistance = FSPagerView.automaticDistance
            case .ferrisWheel, .invertedFerrisWheel:
                self.pageViews.itemSize = CGSize(width: 180, height: 140)
                self.pageViews.decelerationDistance = FSPagerView.automaticDistance
            case .coverFlow:
                self.pageViews.itemSize = CGSize(width: 220, height: 170)
                self.pageViews.decelerationDistance = FSPagerView.automaticDistance
            case .cubic:
                let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                self.pageViews.itemSize = self.pageViews.frame.size.applying(transform)
                self.pageViews.decelerationDistance = 1
            case .none:
                self.pageViews.itemSize = FSPagerView.automaticSize
                self.pageViews.decelerationDistance = 1
            }
        }
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        pageViews = FSPagerView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        pageViews.dataSource = self
        pageViews.delegate = self
        pageViews.isInfinite = true
        pageViews.size = FSPagerView.automaticSize
        pageViews.decelerationDistance = FSPagerView.automaticDistance
        pageViews.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        contentView.addSubview(pageViews)
        // Create a page control
        pageControl = FSPageControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        pageControl.numberOfPages = images.count
        pageControl.isHidden = true
        contentView.addSubview(pageControl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pageViews.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-0)
            make.bottom.equalToSuperview().offset(-5)
            make.size.equalTo(CGSize(width: autoWidth(CGFloat(images.count * 15)), height: autoWidth(15)))
        }

    }
}

extension YLYPageViewStyleOneCell: FSPagerViewDataSource,FSPagerViewDelegate{
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return images.count
    }
        
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: images[index])
        cell.textLabel?.text = transformerNames[index]
        return cell
    }
        
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
}
