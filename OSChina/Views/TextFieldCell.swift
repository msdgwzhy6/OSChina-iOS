//
// Created by LiJianying on 15/9/27.
// Copyright (c) 2015 LiJianying. All rights reserved.
//

import Foundation

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
        self.accessoryView = textField
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
