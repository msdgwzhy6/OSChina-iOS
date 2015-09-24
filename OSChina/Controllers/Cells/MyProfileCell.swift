//
// Created by LiJianying on 15/9/24.
// Copyright (c) 2015 LiJianying. All rights reserved.
//

import UIKit

class MyProfileCell: UITableViewCell {
    var avatar: UIImageView
    var name: UILabel

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {

        self.avatar = UIImageView()
        self.name = UILabel()
        self.name.text = "aaaa"
//        self.contentView.addSubview(name)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.name)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
