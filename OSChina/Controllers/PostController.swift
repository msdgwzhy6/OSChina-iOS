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

class PostController: BaseButtonBarPagerTabStripViewController {
    
    var btnPublishPost: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_POST".localized

        self.btnPublishPost = UIBarButtonItem(title: "ACTION_PUBLISH_POST".localized, style: .Plain, target: self, action: "publishPost:")
        self.navigationItem.rightBarButtonItem = btnPublishPost
    }

    override func childViewControllersForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> [AnyObject]! {
        let controller1 = PostListController(flag: PostListFlag.Qa)
        let controller2 = PostListController(flag: PostListFlag.Share)
        let controller3 = PostListController(flag: PostListFlag.It)
        let controller4 = PostListController(flag: PostListFlag.Job)
        controller1.tableView.contentInset = self.contentInset()
        controller2.tableView.contentInset = self.contentInset()
        controller3.tableView.contentInset = self.contentInset()
        controller4.tableView.contentInset = self.contentInset()
        controller1.tableView.scrollIndicatorInsets = self.scrollIndicatorInsets()
        controller2.tableView.scrollIndicatorInsets = self.scrollIndicatorInsets()
        controller3.tableView.scrollIndicatorInsets = self.scrollIndicatorInsets()
        controller4.tableView.scrollIndicatorInsets = self.scrollIndicatorInsets()
        return [controller1, controller2, controller3, controller4]
    }
    
    func publishPost(sender: UIBarButtonItem) {
        let controller: PublishPostController = PublishPostController(nibName: nil, bundle: nil)
        self.presentViewController(controller, animated: true)
    }
}
