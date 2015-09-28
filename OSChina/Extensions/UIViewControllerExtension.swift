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

extension UIViewController {
    public func presentViewController(viewControllerToPresent: UIViewController, animated: Bool) {
        self.presentViewController(viewControllerToPresent, animated: animated, completion: nil, leftButtonType: LeftButtonType.Close)
    }
    
    public func presentViewController(viewControllerToPresent: UIViewController, animated: Bool, leftButtonType: LeftButtonType) {
        self.presentViewController(viewControllerToPresent, animated: animated, completion: nil, leftButtonType: leftButtonType)
    }

    public func presentViewController(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?, leftButtonType: LeftButtonType) {
        let navigationController: UINavigationController = BaseNavigationController.init(rootViewController: viewControllerToPresent, leftButtonType: leftButtonType)
        navigationController.addChildViewController(viewControllerToPresent)
        navigationController.navigationBar.tintColor = UIColor.whiteColor()
        navigationController.navigationBar.barStyle = UIBarStyle.Black
        navigationController.navigationBar.translucent = false
        navigationController.navigationBar.barTintColor = UIColor.primaryColor()
        navigationController.navigationBar.shadowImage = nil
        self.presentViewController(navigationController, animated: animated, completion: completion)
    }
}
