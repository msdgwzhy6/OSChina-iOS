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
    
    var dataSource: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 88; // 设置为一个接近“平均”行高的值
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.header.beginRefreshing()
        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.rowHeight = UITableViewAutomaticDimension
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
    }

    func colorForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> UIColor! {
            return UIColor.whiteColor()
    }

    override func refresh() {
        let success = {
            (data: [Tweet]) -> Void in
            self.endRefreshing()
            self.dataSource += data
            self.tableView.reloadData()
        };
        let failure = {
            (code: Int, message: String) -> Void in
            self.endRefreshing()
        };
        
        switch (flag) {
        case .Latest:
            ApiClient.tweetListLatest(0, success: success, failure: failure)
            break
        case .Hot:
            ApiClient.tweetListHot(0, success: success, failure: failure)
            break
        case .My:
            ApiClient.tweetListLatest(0, success: success, failure: failure)
            break
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = TweetCell()
        let tweet: Tweet = self.dataSource[indexPath.row] as Tweet
        
        cell.name.text = tweet.author
        cell.avatar.sd_setImageWithURL(NSURL(string: tweet.portrait!))
        cell.date.text = tweet.pubDate
        cell.content.text = tweet.body
        cell.imageSmall.sd_setImageWithURL(NSURL(string: tweet.imgSmall!))
        cell.commentCount.text = "\tweet.commentCount\""
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selected = false
        
        let controller: TweetDetailController = TweetDetailController(nibName: nil, bundle: nil)
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

//    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}