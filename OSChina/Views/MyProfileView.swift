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

    var bottomLayout: UIView = UIView()
    var scoreLabel: UILabel = UILabel()
    var scoreNumber: UILabel = UILabel()
    var fansLabel: UILabel = UILabel()
    var fansCount: UILabel = UILabel()
    var followersLabel: UILabel = UILabel()
    var followersCount: UILabel = UILabel()

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
        // 
        self.bottomLayout.backgroundColor = UIColor(rgba: "#00000040")
        
        self.scoreNumber.textColor = UIColor.whiteColor()
        self.scoreNumber.textAlignment = .Center
        self.scoreNumber.font = UIFont.boldSystemFontOfSize(18)
        self.scoreLabel.textColor = UIColor.whiteColor()
        self.scoreLabel.textAlignment = .Center
        self.scoreLabel.font = UIFont.systemFontOfSize(14)

        self.fansCount.textColor = UIColor.whiteColor()
        self.fansCount.textAlignment = .Center
        self.fansCount.font = UIFont.boldSystemFontOfSize(18)
        self.fansLabel.textColor = UIColor.whiteColor()
        self.fansLabel.textAlignment = .Center
        self.fansLabel.font = UIFont.systemFontOfSize(14)

        self.followersCount.textColor = UIColor.whiteColor()
        self.followersCount.textAlignment = .Center
        self.followersCount.font = UIFont.boldSystemFontOfSize(18)
        self.followersLabel.textColor = UIColor.whiteColor()
        self.followersLabel.textAlignment = .Center
        self.followersLabel.font = UIFont.systemFontOfSize(14)
        
        self.container.addSubview(self.avatar)
        self.container.addSubview(self.name)
        self.container.addSubview(self.bottomLayout)
        
        self.bottomLayout.addSubview(self.scoreNumber)
        self.bottomLayout.addSubview(self.scoreLabel)
        self.bottomLayout.addSubview(self.fansCount)
        self.bottomLayout.addSubview(self.fansLabel)
        self.bottomLayout.addSubview(self.followersCount)
        self.bottomLayout.addSubview(self.followersLabel)
        
        self.container.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.contentView.frame.width).priorityLow()
            make.height.equalTo(180).priorityLow()
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
        self.bottomLayout.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.container.frame.width)
            make.height.equalTo(65)
            make.bottom.equalTo(self.container.snp_bottom)
        }
        self.scoreNumber.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.bottomLayout).dividedBy(3)
            make.height.equalTo(40)
            make.left.equalTo(self.bottomLayout)
            make.top.equalTo(self.bottomLayout.snp_top)
        }
        self.scoreLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.bottomLayout).dividedBy(3)
            make.height.equalTo(25)
            make.left.equalTo(self.bottomLayout)
            make.top.equalTo(35)
        }
        self.fansCount.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.bottomLayout).dividedBy(3)
            make.height.equalTo(40)
            make.left.equalTo(self.scoreNumber.snp_right)
            make.top.equalTo(self.bottomLayout.snp_top)
        }
        self.fansLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.bottomLayout).dividedBy(3)
            make.height.equalTo(25)
            make.left.equalTo(self.scoreLabel.snp_right)
            make.top.equalTo(35)
        }
        self.followersCount.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.bottomLayout).dividedBy(3)
            make.height.equalTo(40)
            make.left.equalTo(self.fansCount.snp_right)
            make.top.equalTo(self.bottomLayout.snp_top)
        }
        self.followersLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.bottomLayout).dividedBy(3)
            make.height.equalTo(25)
            make.left.equalTo(self.fansCount.snp_right)
            make.top.equalTo(35)
        }
    }
    
    func bind(data: User?) {
        self.followersLabel.text = "个关注"
        self.fansLabel.text = "个粉丝"
        self.scoreLabel.text = "点积分"
        if (data == nil) {
            self.name.text = "登录/注册"
            self.avatar.sd_setImageWithURL(nil)
            self.scoreNumber.text = "0"
            self.fansCount.text = "0"
            self.followersCount.text = "0"
        } else {
            self.name.text = data!.name
            self.avatar.sd_setImageWithURL(NSURL(string: (data?.portrait)!))
            self.scoreNumber.text = "\(data!.score)"
            self.fansCount.text = "\(data!.fans)"
            self.followersCount.text = "\(data!.followers)"
        }
    }
}
