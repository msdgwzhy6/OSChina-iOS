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

class EventListController: BaseListController<Event> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_EVENT_LIST".localized
        
        self.firstRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadData(page: Int) {
        let success = {
            (data: [Event]) -> Void in
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
        ApiClient.eventListLatest(page, success: success, failure: failure)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let event: Event = self.dataSource[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.imageView!.sd_setImageWithURL(NSURL(string: event.cover!))
        cell.textLabel!.text = event.title
        cell.detailTextLabel!.text = event.startTime
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
