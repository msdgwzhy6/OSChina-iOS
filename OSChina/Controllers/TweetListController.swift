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

enum TweetListFlag {
    case Latest
    case Hot
    case My
}

class TweetListController: BaseTableViewController, XLPagerTabStripChildItem {
    
    var flag: TweetListFlag = TweetListFlag.Latest
    
    init(flag: TweetListFlag) {
        self.flag = flag
        super.init(style: .Plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titleForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> String! {
        switch (flag) {
        case .Latest:
            return "TAB_TWEET_LIST_LATEST".localized
        case .Hot:
            return "TAB_TWEET_LIST_HOT".localized
        case .My:
            return "TAB_TWEET_LIST_MY".localized
        }
        return " "
    }

    func colorForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> UIColor! {
            return UIColor.whiteColor()
    }

    override func refresh() {
        ApiClient.tweetListHot(1,
            success: {
                (data) -> Void in
                self.endRefreshing()
            },
            failure: {
                (code, message) -> Void in
                self.endRefreshing()
            }
        )
    }
}