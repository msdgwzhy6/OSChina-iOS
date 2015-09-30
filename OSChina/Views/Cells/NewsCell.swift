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

class NewsCell: UITableViewCell {
    
    var title: UILabel = UILabel()
    var body: UILabel = UILabel()
    var author: UILabel = UILabel()
    var pubDate: UILabel = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.body)
        self.contentView.addSubview(self.author)
        self.contentView.addSubview(self.pubDate)
        
        self.title.numberOfLines = 0
        self.title.font = UIFont.boldSystemFontOfSize(16)
        
        self.body.textColor = UIColor.grayColor()
        self.body.font = UIFont.systemFontOfSize(16)
        self.body.numberOfLines = 0
        
        self.author.textColor = UIColor.grayColor()
        self.author.font = UIFont.systemFontOfSize(14)
        
        self.pubDate.textColor = UIColor.grayColor()
        self.pubDate.font = UIFont.systemFontOfSize(14)

//        self.title.backgroundColor = UIColor.redColor()
//        self.body.backgroundColor = UIColor.orangeColor()
//        self.author.backgroundColor = UIColor.blackColor()
//        self.pubDate.backgroundColor = UIColor.brownColor()
        
        // top -> left -> bottom -> right
        let padding: UIEdgeInsets = UIEdgeInsetsMake(8, 16, 8, 8)
        
        self.title.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(padding.top)
            make.left.equalTo(padding.left)
            make.right.equalTo(-padding.right)
        }

        self.body.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.title.snp_bottom).inset(-5)
            make.left.equalTo(padding.left)
            make.right.equalTo(-padding.right)
        }
        self.author.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.body.snp_bottom).inset(-5)
            make.left.equalTo(padding.left)
        }
        self.pubDate.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.author.snp_right).inset(-5)
            make.centerY.equalTo(self.author)
        }
        self.contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.bottom.equalTo(self.pubDate.snp_bottom).inset(-padding.bottom)
        }
    }
    
    func bind(data: News) {
        self.author.text = data.author
        self.pubDate.text = data.pubDate
        self.title.text = data.title
        self.body.text = data.body
        self.layoutIfNeeded()
    }
}
