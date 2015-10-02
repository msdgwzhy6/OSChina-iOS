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

class ActivitiesLatestView: UITableViewCell {

    var container: UIView = UIView()
    
    init() {
        super.init(style: .Default, reuseIdentifier: "Cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.container.backgroundColor = UIColor.grayColor()
        
        self.contentView.addSubview(self.container)
        
        self.container.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.contentView.frame.width).priorityLow()
            make.height.equalTo(200).priorityLow()
            make.top.equalTo(self.contentView)
        }
        self.contentView.snp_makeConstraints { (make) -> Void in
//            make.height.equalTo(100)
            make.edges.equalTo(self)
            make.bottom.equalTo(self.container)
        }
        
    }
}
