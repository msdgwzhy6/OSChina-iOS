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

class TweetListController: BaseListController<Tweet>, XLPagerTabStripChildItem {
    
    var flag: TweetListFlag = TweetListFlag.Latest
    
    init(flag: TweetListFlag) {
        self.flag = flag
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 88;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.registerClass(TweetCell.self, forCellReuseIdentifier: "Cell")
        
        self.firstRefreshing()
        if (flag == .My) {
            self.title = "TITLE_MY_TWEET".localized
        }
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

    override func loadData(page: Int) {
        let success = {
            (data: [Tweet]) -> Void in
            // 下拉刷新时清空数据源
            if (page == 0) {
                self.dataSource = []
            }
            self.dataSource += data
            // 停止刷新中
            self.endRefreshing()
            self.tableView.reloadData()
        };
        let failure = {
            (code: Int, message: String) -> Void in
            self.endRefreshing()
        };
        
        switch (flag) {
        case .Latest:
            ApiClient.tweetListLatest(page, success: success, failure: failure)
            break
        case .Hot:
            ApiClient.tweetListHot(page, success: success, failure: failure)
            break
        case .My:
            ApiClient.tweetListMy(page, success: success, failure: failure)
            break
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TweetCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TweetCell
//        if (cell == nil) {
//            print("new cell")
//            print(indexPath)
//            cell = TweetCell()
//        }
        let tweet: Tweet = self.dataSource[indexPath.row]
        cell.bind(tweet)
        cell.layoutIfNeeded()
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selected = false
        
        let controller: TweetDetailController = TweetDetailController()
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tweet: Tweet = self.dataSource[indexPath.row]
        return self.tableView.fd_heightForCellWithIdentifier("Cell", cacheByKey: tweet.id, configuration: {
            (cell) -> Void in
//            cell.bind(tweet)
            let cell2 = cell as! TweetCell
            print(cell)
            print(tweet)
            cell2.bind(tweet)
            cell.layoutIfNeeded()
            cell.setNeedsUpdateConstraints()
            cell.updateConstraintsIfNeeded()
        })
    }
//    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}