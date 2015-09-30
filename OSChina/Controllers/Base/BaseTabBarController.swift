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

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.primaryColor()
    }

    func addTab(title: String?, icon: String?, controller: UIViewController?) {
        controller?.title = title
        if (icon != nil) {
            controller?.tabBarItem.image = UIImage(named: icon!)
        }
        let navigationController: UINavigationController = UINavigationController.init(rootViewController: controller!)
        navigationController.navigationBar.tintColor = UIColor.whiteColor()
        navigationController.navigationBar.barStyle = UIBarStyle.Black
        navigationController.navigationBar.translucent = false
        navigationController.navigationBar.barTintColor = UIColor.primaryColor()
        navigationController.navigationBar.shadowImage = nil
        navigationController.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        self.addChildViewController(navigationController)
    }
}
