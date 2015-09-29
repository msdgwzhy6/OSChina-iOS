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

class HomeController: BaseTabBarController {
    
    var newsController     : NewsController?        // 资讯
    var qsnController      : QuestionController?    // 问题
    var tweetController    : TweetController?       // 动弹
    var discoveryController: DiscoveryController?   // 发现
    var myController       : MyController?          // 我的

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsController      = NewsController(nibName: nil, bundle: nil)
        self.qsnController       = QuestionController(nibName: nil, bundle: nil)
        self.tweetController     = TweetController(nibName: nil, bundle: nil)
        self.discoveryController = DiscoveryController(nibName: nil, bundle: nil)
        self.myController        = MyController(nibName: nil, bundle: nil)
        
        // 增加Tab
        self.addTab("TAB_TWEET".localized, controller: self.tweetController)
        self.addTab("TAB_NEWS".localized, controller: self.newsController)
        self.addTab("TAB_QUESTION".localized, controller: self.qsnController)
//        self.addTab("TAB_TWEET".localized, controller: self.tweetController)
        self.addTab("TAB_DISCOVERY".localized, controller: self.discoveryController)
        self.addTab("TAB_MY".localized, controller: self.myController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
