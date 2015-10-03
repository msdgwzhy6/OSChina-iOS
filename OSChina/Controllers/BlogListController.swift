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

enum BlogListFlag {
    case Latest
    case Recommend
    case My
}

class BlogListController: BaseListController<Blog>, XLPagerTabStripChildItem {
    
    var flag: BlogListFlag = BlogListFlag.Latest

    init(flag: BlogListFlag) {
        self.flag = flag
        super.init()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.firstRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func titleForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> String! {
        switch (flag) {
        case .Latest:
            return "TAB_BLOG_LIST_LATEST".localized
        case .Recommend:
            return "TAB_BLOG_LIST_RECOMMEND".localized
        case .My:
            return "TAB_BLOG_LIST_MY".localized
        }
    }
    
    override func loadData(page: Int) {
        let success = {
            (data: [Blog]) -> Void in
            // 下拉刷新时清空数据源
            if (page == 0) {
                self.dataSource = []
            }
            self.dataSource += data
            // 停止刷新中...
            self.endRefreshing()
            self.tableView.reloadData()
        };
        let failure = {
            (code: Int, message: String) -> Void in
            self.endRefreshing()
        };
        // latest-最新 recommend-推荐
        switch (flag) {
        case .Latest:
            ApiClient.blogList(page, type: "latest", success: success, failure: failure)
            break
        case .Recommend:
            ApiClient.blogList(page, type: "recommend", success: success, failure: failure)
            break
        case .My:
            delay(1, closure: { () -> () in
                self.endRefreshing()
            })
            break
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let blog: Blog = self.dataSource[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel!.text = blog.title
        cell.detailTextLabel!.text = blog.pubDate
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
