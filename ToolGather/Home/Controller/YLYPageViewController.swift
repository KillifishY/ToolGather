//
//  FSPageViewController.swift
//  ToolGather
//
//  Created by 于浏洋 on 2022/5/20.
//

import Foundation
import FSPagerView

class YLYPageViewController: BaseViewController{
    
    var transformTypes : [FSPagerViewTransformerType] = [.crossFading,
                                                         .zoomOut,
                                                         .depth,
                                                         .overlap,
                                                         .linear,
                                                         .coverFlow,
                                                         .ferrisWheel,
                                                         .invertedFerrisWheel,
                                                         .cubic]
    
    lazy var giftTableview: UITableView = {
        let tableview: UITableView = UITableView(frame:self.view.bounds, style: .plain)
        tableview.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = autoWidth(200)
        
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "FSPageView使用"
        
        self.view.addSubview(giftTableview)
        
        giftTableview.register(YLYPageViewStyleOneCell.self)
    }
}

extension YLYPageViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(with: YLYPageViewStyleOneCell.self, for: indexPath)
        cell.transformType = transformTypes[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         print(indexPath.row)
    }
}
