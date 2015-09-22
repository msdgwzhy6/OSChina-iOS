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

class HomeController: UITabBarController {

    var tweetListController: TweetListController?
    var newsListController: NewsListController?
    var discoveryController: DiscoveryController?
    var myController: MyController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tweetListController = TweetListController(nibName: nil, bundle: nil)
        self.newsListController  = NewsListController(nibName: nil, bundle: nil)
        self.discoveryController = DiscoveryController(nibName: nil, bundle: nil)
        self.myController        = MyController(nibName: nil, bundle: nil)
        
        setupUINavigationController("动弹", controller: self.tweetListController)
        setupUINavigationController("新闻", controller: self.newsListController)
        setupUINavigationController("发现", controller: self.discoveryController)
        setupUINavigationController("我的", controller: self.myController)
        self.tabBar.tintColor = UIColor(red: 0.255, green: 0.671, blue: 0.329, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUINavigationController(title: String?, controller: UIViewController?) {
        let tintColor: UIColor = UIColor(red: 0.255, green: 0.671, blue: 0.329, alpha: 1)
        controller!.title = title
        let navController: UINavigationController = UINavigationController.init(rootViewController: controller!)
        navController.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        navController.navigationBar.barTintColor = tintColor
        self.addChildViewController(navController)
    }

}
