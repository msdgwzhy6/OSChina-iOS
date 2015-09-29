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

class TextFieldCell: UITableViewCell {
    
    var textField: UITextField = UITextField()
    
    convenience init(reuseIdentifier: String?) {
        self.init(style: .Default, reuseIdentifier: reuseIdentifier)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.textField.autocapitalizationType = .None
        self.textField.autocorrectionType = .No
        self.textField.clearButtonMode = .WhileEditing
        self.textField.frame = self.frame
        self.textField.contentMode = UIViewContentMode.ScaleAspectFit
        self.selectionStyle = .None
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(textField)
        // 设置text属性后即可获取到textLabel的宽高等位置属性
        self.textLabel?.text = " "
        self.textField.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.textLabel!)
            make.height.equalTo(self.textLabel!)
            make.left.equalTo(self.textLabel!)
            make.right.equalTo(self.textLabel!)
        }
    }
}
