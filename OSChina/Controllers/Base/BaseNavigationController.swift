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

public enum LeftButtonType {
    case Close
    case Cancel
}

class BaseNavigationController: UINavigationController {

    var leftButtonType: LeftButtonType = LeftButtonType.Close

    init(rootViewController: UIViewController, leftButtonType: LeftButtonType) {
//        super.init(rootViewController: rootViewController)
        super.init(nibName: nil, bundle: nil)
//        self.viewControllers = rootViewController
        self.leftButtonType = leftButtonType
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        switch (leftButtonType) {
        case .Cancel:
            let btnCancel: UIBarButtonItem = UIBarButtonItem(title: "ACTION_CANCEL".localized, style: .Plain, target: self, action: "cancel:")
            self.childViewControllers[0].navigationItem.leftBarButtonItem = btnCancel
            break
        case .Close:
            let btnClose: UIBarButtonItem = UIBarButtonItem(title: "ACTION_CLOSE".localized, style: .Plain, target: self, action: "close:")
            self.childViewControllers[0].navigationItem.leftBarButtonItem = btnClose
            break
        }
    }
    
    func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func close(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
