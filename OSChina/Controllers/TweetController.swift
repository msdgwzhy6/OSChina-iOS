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
import XLPagerTabStrip

class TweetController: BaseButtonBarPagerTabStripViewController {

    var btnPublishTweet: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_TWEET".localized
        
        self.btnPublishTweet = UIBarButtonItem(title: "ACTION_PUBLISH_TWEET".localized, style: .Plain, target: self, action: "publishTweet:")
        self.navigationItem.rightBarButtonItem = btnPublishTweet

    }

    override func childViewControllersForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> [AnyObject]! {
        let controller1 = TweetListController(flag: TweetListFlag.Latest)
        let controller2 = TweetListController(flag: TweetListFlag.Hot)
        controller1.tableView.contentInset = self.contentInset()
        controller2.tableView.contentInset = self.contentInset()
        controller1.tableView.scrollIndicatorInsets = self.scrollIndicatorInsets()
        controller2.tableView.scrollIndicatorInsets = self.scrollIndicatorInsets()
        controller1.tabStripViewController = self
        controller2.tabStripViewController = self
        return [controller1, controller2]
    }

    func publishTweet(sender: UIBarButtonItem) {
        let controller: PublishTweetController = PublishTweetController()
        self.presentViewController(controller, animated: true, leftButtonType: .Cancel)
    }
    
}
