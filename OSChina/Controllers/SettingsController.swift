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

class SettingsController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
//        self.navigationController?.navigationItem.backBarButtonItem?.title = "返回"
//        self.navigationItem.backBarButtonItem!.title = "fdsfdsf"
//        self.navigationItem.title = "ABC"
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.title = "back"
        
//        let backBarButtonItem: UIBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: nil, action: "sss")
//        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.title = "设置"
//        self.navigationItem.backBarButtonItem?.title = "返回"
//        self.navigationController?.navigationBar.backItem?.title = "返回"
//        self.navigationController?.navigationItem.backBarButtonItem?.title = "返回"
//        self.navigationController?.navigationBar.topItem?.title = "返回"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

}
