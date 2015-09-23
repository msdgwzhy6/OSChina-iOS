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

class SettingsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupUINavigationController("资讯")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUINavigationController(title: String?) {
        let tintColor: UIColor = UIColor(red: 0.255, green: 0.671, blue: 0.329, alpha: 1)
        let navController: UINavigationController = UINavigationController.init(rootViewController: self)
        navController.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        navController.navigationBar.barTintColor = tintColor
//        self.navigationController = navController
//        self.addChildViewController(navController)
    }


}
