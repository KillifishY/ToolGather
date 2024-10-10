//
//  Home.swift
//  ToolGather
//
//  Created by 于浏洋 on 2022/5/16.
//

import UIKit

protocol HomeRouterHandle {
    func gotoHomeSubmodule(_ submodule: HomeSubmodule, params: Dictionary<String, Any>?)
}

class HomeViewController: BaseViewController {

    private var router: HomeRouter?
    
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
        
        router = HomeRouter.init(self)

        self.navigationItem.title = "首页"
        self.view.addSubview(tableview)
        //注册cell
        tableview.register(UITableViewCell.self)
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource  {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return  HomeSubmodule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(with: UITableViewCell.self, for: indexPath) as UITableViewCell
        cell.selectionStyle = .none
        cell.textLabel?.text = HomeSubmodule(rawValue: indexPath.row)?.modualDescribtion
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: false)
        let rawValue =  HomeSubmodule(rawValue: indexPath.row)

        switch rawValue {
        case .photoList:
            router?.gotoHomeSubmodule(.photoList, params: nil)

        case .FSPageView:
            router?.gotoHomeSubmodule(.FSPageView, params: nil)
            
        case .CollectionView:
            router?.gotoHomeSubmodule(.CollectionView, params: nil)
            
        case .PhotoPiker:
            router?.gotoHomeSubmodule(.PhotoPiker, params: nil)
            
        case .SoulBall:
            router?.gotoHomeSubmodule(.SoulBall, params: nil)
            
        case .ImageBlur:
            router?.gotoHomeSubmodule(.ImageBlur, params: nil)

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
//        case .faceRecognition:
//              router?.gotoHomeSubmodule(.faceRecognition, params: nil)

        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
