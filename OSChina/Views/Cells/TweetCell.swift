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
    
    var pubDate: UILabel = UILabel()
    var content: UILabel = UILabel()
    var imageSmall: UIImageView = UIImageView(frame: CGRectMake(0, 0, 0, 0))
    var commentCount: UILabel = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        // 头像
        self.avatar.backgroundColor = UIColor.blueColor()
        self.avatar.multipleTouchEnabled = true
        self.avatar.userInteractionEnabled = true
        // 名字
        self.name.textColor = UIColor.grayColor()
        self.name.font = UIFont.systemFontOfSize(14)
        self.name.userInteractionEnabled = true
        self.name.numberOfLines = 0
        
        self.content.numberOfLines = 0
        
        self.imageSmall.backgroundColor = UIColor.brownColor()
        self.imageSmall.contentMode = .ScaleAspectFill
        
        
        self.contentView.addSubview(self.avatar)
        self.contentView.addSubview(self.name)
        self.contentView.addSubview(self.pubDate)
        self.contentView.addSubview(self.content)
        self.contentView.addSubview(self.imageSmall)
        self.contentView.addSubview(self.commentCount)
        
//        self.textLabel?.text = " "
//        self.textLabel!.numberOfLines = 0

        // top -> left -> bottom -> right
        let padding: UIEdgeInsets = UIEdgeInsetsMake(8, 16, 10, 8)
        print(padding)
        self.content.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(padding.top)
            make.left.equalTo(padding.left)
            make.right.equalTo(self.avatar.snp_left)
            
        }
        self.avatar.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(padding.top)
            make.right.equalTo(-padding.right)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        self.name.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.content.snp_bottom)
            make.left.equalTo(padding.left)
//            make.bottom.equalTo(-padding.bottom)
        }
        self.contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.bottom.equalTo(self.name.snp_bottom)
        }
    }
    
    
    
    func bind(data: Tweet) {
        self.name.text = data.author
        self.avatar.sd_setImageWithURL(NSURL(string: data.portrait!))
        self.pubDate.text = data.pubDate
        self.content.text = data.body
        self.imageSmall.sd_setImageWithURL(NSURL(string: data.imgSmall!))
        self.commentCount.text = "\tweet.commentCount\""
        self.layoutIfNeeded()
    }
}
