//
// Created by LiJianying on 15/9/24.
// Copyright (c) 2015 LiJianying. All rights reserved.
//

import UIKit
import SnapKit

class MyProfileCell: UITableViewCell {
    var container = UIView()
    var avatar: UIImageView = UIImageView(frame: CGRectMake(0, 0, 50, 50))
    var name: UILabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.frame = CGRectMake(0, 0, 0, 800)
        self.backgroundColor = UIColor.primaryColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(self.container)
        // 容器
        self.container.frame.size.width = self.frame.width
//        self.container.backgroundColor = UIColor.grayColor()
        // 头像
        self.avatar.backgroundColor = UIColor.blueColor()
        self.avatar.userInteractionEnabled = true
        // 名字
        self.name.textColor = UIColor.whiteColor()
        self.name.userInteractionEnabled = true

        self.container.addSubview(self.avatar)
        self.container.addSubview(self.name)
        
        self.container.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.contentView.frame.width).priorityLow()
            make.height.equalTo(200).priorityLow()
            make.bottomMargin.equalTo(self.contentView)
        }
        self.avatar.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.centerX.equalTo(self.container)
            make.topMargin.equalTo(self.container).offset(10)
        }
        self.name.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.container)
            make.top.equalTo(self.avatar.snp_bottom).offset(8)
        }
    }
}
