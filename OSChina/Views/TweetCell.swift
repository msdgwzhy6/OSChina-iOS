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

class TweetCell: UITableViewCell {
    
    var avatar: UIImageView = UIImageView(frame: CGRectMake(0, 0, 0, 0))
    var name: UILabel = UILabel()
    
    var date: UILabel = UILabel()
    var content: UILabel = UILabel()
    var imageSmall: UIImageView = UIImageView(frame: CGRectMake(0, 0, 10, 10))
    var commentCount: UILabel = UILabel()
    
    init() {
        super.init(style: .Default, reuseIdentifier: "Cell")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 头像
        self.avatar.backgroundColor = UIColor.blueColor()
        self.avatar.multipleTouchEnabled = true
        self.avatar.userInteractionEnabled = true
        // 名字
        self.name.textColor = UIColor.blackColor()
        self.name.userInteractionEnabled = true
        
        self.content.numberOfLines = 0
        self.imageSmall.backgroundColor = UIColor.brownColor()
        
        self.contentView.addSubview(self.avatar)
        self.contentView.addSubview(self.name)
        self.contentView.addSubview(self.date)
        self.contentView.addSubview(self.content)
        self.contentView.addSubview(self.imageSmall)
        self.contentView.addSubview(self.commentCount)
        
        self.avatar.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.right.equalTo(self.contentView)
        }
        self.name.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.contentView)
            make.top.equalTo(self.imageSmall.snp_bottom)
        }
        self.content.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.contentView).offset(-self.avatar.frame.width) //.inset(self.avatar.frame.width)
            make.left.equalTo(self.contentView)
            make.top.equalTo(self.contentView)
        }
        self.imageSmall.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(self.content.snp_bottom)
        }
//        self.contentView.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(5)
//            make.right.equalTo(-5)
//            make.top.equalTo(20)
//        }
        
        print(self.frame)
    }
}
