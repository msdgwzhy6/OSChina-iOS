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

enum PostListFlag {
    case Qa
    case Share
    case It
    case Job
}

class PostListController: BaseListController<Post>, XLPagerTabStripChildItem  {
    
    
    var flag: PostListFlag = PostListFlag.Qa
    
    init(flag: PostListFlag) {
        self.flag = flag
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var btnPublishPost: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnPublishPost = UIBarButtonItem(title: "提问", style: .Plain, target: self, action: "publishPost:")
        
        self.beginRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titleForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> String! {
        switch (flag) {
        case .Qa:
            return "TAB_POST_LIST_QA".localized
        case .Share:
            return "TAB_POST_LIST_SHARE".localized
        case .It:
            return "TAB_POST_LIST_IT".localized
        case .Job:
            return "TAB_POST_LIST_JOB".localized
        }
    }
    
    func publishPost(sender: UIBarButtonItem) {
        let controller: PublishPostController = PublishPostController()
        self.presentViewController(controller, animated: true)
    }

    override func loadData(page: Int) {
        let success = {
            (data: [Post]) -> Void in
            // 下拉刷新时清空数据源
            if (page == 0) {
                self.dataSource = []
            }
            self.dataSource += data
            self.tableView.reloadData()
            // 停止刷新中...
            self.endRefreshing()
        };
        let failure = {
            (code: Int, message: String) -> Void in
            self.endRefreshing()
        };
        // 类别ID 1-问答 2-分享 3-IT杂烩(综合) 4-站务 100-职业生涯 0-所有
        switch (flag) {
        case .Qa:
            ApiClient.postList(page, catalog: 1, success: success, failure: failure)
            break
        case .Share:
            ApiClient.postList(page, catalog: 2, success: success, failure: failure)
            break
        case .It:
            ApiClient.postList(page, catalog: 3, success: success, failure: failure)
            break
        case .Job:
            ApiClient.postList(page, catalog: 100, success: success, failure: failure)
            break
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post: Post = self.dataSource[indexPath.row]

        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel!.text = post.title
        cell.detailTextLabel!.text = post.pubDate
        cell.accessoryType = .DisclosureIndicator
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selected = false

        //        let controller: TweetDetailController = TweetDetailController(nibName: nil, bundle: nil)
        //        controller.hidesBottomBarWhenPushed = true
        //        self.navigationController?.pushViewController(controller, animated: true)
    }

}