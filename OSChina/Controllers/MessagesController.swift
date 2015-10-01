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

class MessagesController: BaseMJRefreshTableViewController {
    
    var dataSource: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_MESSAGES".localized
        
        self.beginRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadData(page: Int) {
        let success = {
            (data: [Message]) -> Void in
            self.endRefreshing()
            // 下拉刷新时清空数据源
            if (page == 0) {
                self.dataSource = []
            }
            self.dataSource += data
            self.tableView.reloadData()
            // 没有更多数据
            if (self.dataSource.count % ApiClient.PAGE_SIZE != 0 || (page > 0 && data.count == 0)) {
                self.tableView.footer.noticeNoMoreData()
            }
        };
        let failure = {
            (code: Int, message: String) -> Void in
            self.endRefreshing()
        };
        ApiClient.messageList(page, success: success, failure: failure)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let message: Message = self.dataSource[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CELL_IDENTIFIER)
        cell.imageView!.sd_setImageWithURL(NSURL(string: message.portrait!))
        cell.textLabel!.text = message.friendname
        cell.detailTextLabel!.text = message.content
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