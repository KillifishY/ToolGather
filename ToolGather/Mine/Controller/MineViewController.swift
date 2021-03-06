//
//  MineViewController.swift
//  ToolGather
//
//  Created by 于浏洋 on 2022/5/16.
//

import Foundation
import UIKit

class MineViewController: BaseViewController {

    
    lazy var tableview: UITableView = {
        let tableview: UITableView = UITableView(frame:self.view.bounds, style: .plain)
        tableview.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 50
        return tableview
    }()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "我的"
        self.view.addSubview(tableview)
        //注册cell
        tableview.register(UITableViewCell.self)
    }
}

extension MineViewController: UITableViewDelegate,UITableViewDataSource  {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return  HomeSubmodule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(with: UITableViewCell.self, for: indexPath) as UITableViewCell
        cell.selectionStyle = .none
//        cell.textLabel?.text = HomeSubmodule(rawValue: indexPath.row)?.modualDescribtion
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: false)
        let rawValue =  HomeSubmodule(rawValue: indexPath.row)
//
//        switch rawValue {
//        case .photoList:
//            router?.gotoHomeSubmodule(.photoList, params: nil)
//
//        case .dSBridge:
//            router?.gotoHomeSubmodule(.dSBridge, params: nil)
//
//        case .Model_To_Dictionary:
//            router?.gotoHomeSubmodule(.Model_To_Dictionary, params: nil)
//
//        case .mirrorVC:
//            router?.gotoHomeSubmodule(.mirrorVC, params: nil)
//
//        case .WCDB_VC:
//            router?.gotoHomeSubmodule(.WCDB_VC, params: nil)
//
//        case .WebRTC_VC:
//            router?.gotoHomeSubmodule(.WebRTC_VC, params: nil)
//
//            case .faceRecognition:
//                router?.gotoHomeSubmodule(.faceRecognition, params: nil)
//
//        default:
//            break
//        }
    }
    
}
