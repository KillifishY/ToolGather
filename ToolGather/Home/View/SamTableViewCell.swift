//
//  SamTableViewCell.swift
//  SwiftDemo
//
//  Created by sam   on 2019/4/24.
//  Copyright © 2019 sam  . All rights reserved.
//

import UIKit
import SnapKit

class SamTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var iconImv: UIImageView!    // 头像

    override func awakeFromNib() {
        super.awakeFromNib()

    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel()
        titleLabel.font = autoFontSize(14)
        titleLabel.textColor = .black
        
        contentView.addSubview(titleLabel)
        
        // 头像
        iconImv = UIImageView()
        iconImv.layer.masksToBounds = true
        iconImv.layer.cornerRadius = 5.0
        iconImv.isUserInteractionEnabled = true

        contentView.addSubview(iconImv)

    }


//    func cellWithTableView<T: UITableViewCell>(tableView : UITableView, cellCls:T.Type) -> T {
//
//        let cellid = Sam_ClassName
//        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as! SamTableViewCell
//        if cell == nil {
//            cell = SamTableViewCell (style: .subtitle, reuseIdentifier: cellid)
//        }
//        return cell as! T
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(autoWidth(16))
            make.right.equalToSuperview().offset(autoWidth(-90))
        }
        //iconImv.frame = contentView.bounds
        iconImv.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: autoWidth(60), height: autoWidth(60)))
            make.right.equalToSuperview().offset(autoWidth(-15))
            make.top.equalTo(titleLabel)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)




    }

}
