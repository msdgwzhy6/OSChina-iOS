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

class MyController: UITableViewController {

    var settingsController: SettingsController?

    var btnSettings: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSettings = UIBarButtonItem(title: "设置", style: .Plain, target: self, action: "clickSettings:")
        self.btnSettings?.tintColor = UIColor.whiteColor()
        
        self.navigationItem.title = "我的主页"
        self.navigationItem.rightBarButtonItem = btnSettings
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func clickSettings(sender: UIBarButtonItem) {
        self.settingsController = SettingsController(nibName: nil, bundle: nil)
        self.presentViewController(settingsController!, animated: true, completion: nil)
    }
}