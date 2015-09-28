/**
 * Copyright (C) 2015 JianyingLi
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
        self.avatar.multipleTouchEnabled = true
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
