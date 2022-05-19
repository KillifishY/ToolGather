//
//  SwiftJson_HandyJson_VC.swift
//  ToolGather
//
//  Created by 于浏洋 on 2022/5/16.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import HandyJSON

// 相当于数据模型model
struct ItemsModel: HandyJSON {
    
    var imgUrl = ""
    var name  = ""
}

class SwiftyJSON_HandyJson_VC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var giftTableview: UITableView = {
        let tableview: UITableView = UITableView(frame:self.view.bounds, style: .plain)
        tableview.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = autoWidth(90)
        
        return tableview
    }()
    
    // 数据源
    var dataArray = [ItemsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "SwiftyJSON_HandyJson的使用"
        
        self.view.addSubview(giftTableview)
        self.AlamofireGetRequest()
        //self.AlamofirePostRequest()
        //注册cell
        giftTableview.register(SamTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(with: SamTableViewCell.self, for: indexPath)
        let model = self.dataArray[indexPath.row]
        cell.iconImv.kf.setImage(with: URL(string: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G020114924%2F200G0114924-15-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1655460024&t=eda1ecdebab174791c9f8eea54fb443e"))
        cell.titleLabel.text = model.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         print(indexPath.row)
    }
}

extension SwiftyJSON_HandyJson_VC{

    func AlamofireGetRequest() {
       
        NetworkManager.NetWorkRequest(.getPhotoList, completion: { (JSOnDictory) -> (Void) in//JSOnDictory 是Json类型
            //print(json)
            let dataARR =  JSOnDictory["data"].arrayObject
            if let arr = JSONDeserializer<ItemsModel>.deserializeModelArrayFrom(array: dataARR) {
                let arr1 = arr.compactMap({$0})
                self.dataArray = arr1
                self.giftTableview.reloadData()
            }
        }) { (errorStr) -> (Void) in
            print(errorStr)
        }
    }
}
