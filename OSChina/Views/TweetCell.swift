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
    var imageSmall: UIImageView = UIImageView(frame: CGRectMake(0, 0, 0, 0))
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
//            make.edges.equalTo(self.contentView)
        }
        self.date.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.name.snp_top)
            make.left.equalTo(self.name.snp_right)
        }
        self.content.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.contentView).offset(-50)
            make.left.equalTo(self.contentView)
            make.top.equalTo(self.contentView)
        }
        self.imageSmall.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(self.content.snp_bottom)
        }

//        self.contentView.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(5)
//            make.right.equalTo(-5)
//            make.top.equalTo(20)
//        }
        
//        self.contentView.snp_makeConstraints { (make) -> Void in
//            make.height.equalTo(self.content.frame.height + self.name.frame.height + self.imageSmall.frame.height)
//        }
//        self.contentView.snp_makeConstraints { (make) -> Void in
//            let ch = self.content.frame.height
//            let nh = self.name.frame.height
////            let h: CGFloat? = ch! + nh!
//            let h: Float = Float(ch) + Float(nh)
//            print(h)
////            if (nil != h) {
//            if (h > 0) {
//            make.height.equalTo(h)
////            }
//            }
//            make.edges.equalTo(self)
//        }

        self.contentView.snp_makeConstraints { (make) -> Void in
//            make.height.equalTo(self.content)
            make.edges.equalTo(self)
            make.bottom.equalTo(self.name.snp_bottom)
        }
        
//        print(self.contentView.frame.size.height)
    }
}
