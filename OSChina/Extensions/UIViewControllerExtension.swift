//
// Created by LiJianying on 15/9/26.
// Copyright (c) 2015 LiJianying. All rights reserved.
//

import UIKit

extension UIViewController {
    public func presentViewController(viewControllerToPresent: UIViewController, animated: Bool) {
        let navigationController: UINavigationController = UINavigationController.init(rootViewController: viewControllerToPresent)
        navigationController.navigationBar.tintColor = UIColor.whiteColor()
        navigationController.navigationBar.barStyle = UIBarStyle.Black
        navigationController.navigationBar.translucent = false
        navigationController.navigationBar.barTintColor = UIColor.primaryColor()
        navigationController.navigationBar.shadowImage = nil
        self.presentViewController(navigationController, animated: animated, completion: nil)
    }
}
