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

class TweetListController: BaseTableViewController, XLPagerTabStripChildItem {
    
    var publishTweetController: PublishTweetController?

    var btnPublishTweet: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnPublishTweet = UIBarButtonItem(title: "发表", style: .Plain, target: self, action: "clickPublishTweet:")
        self.btnPublishTweet?.tintColor = UIColor.whiteColor()
        
        self.navigationItem.title = "动弹"
        self.navigationItem.rightBarButtonItem = btnPublishTweet
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clickPublishTweet(sender: UIBarButtonItem) {
        self.publishTweetController = PublishTweetController(nibName: nil, bundle: nil)
        self.presentViewController(publishTweetController!, animated: true, completion: nil)
    }
    
    func titleForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> String! {
        return "test"
    }

    func colorForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> UIColor! {
            return UIColor.redColor()
    }


}