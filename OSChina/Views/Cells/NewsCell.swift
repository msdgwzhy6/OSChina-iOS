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
    var author: UILabel = UILabel()
    var pubDate: UILabel = UILabel()
    
//    init() {
//        super.init(style: .Default, reuseIdentifier: "Cell")
//    }
//    
//    required init?(coder aDedacoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.author)
        self.contentView.addSubview(self.pubDate)
        
        self.title.numberOfLines = 0

        self.title.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.contentView)
            make.left.equalTo(self.contentView)
            make.top.equalTo(self.contentView)
        }
        self.author.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.title.snp_bottom)
        }
        self.pubDate.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.title.snp_bottom)
            make.left.equalTo(self.author.snp_right)
        }
        self.contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.bottom.equalTo(self.author.snp_bottom)
        }
    }
    
    func bind(data: News) {
        self.author.text = data.author
        self.pubDate.text = data.pubDate
        self.title.text = data.title
    }
}
