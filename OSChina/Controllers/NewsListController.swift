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

enum NewsListFlag {
    case All        // 全部
    case Industry   // 行业
    case Project    // 软件
}

class NewsListController: BaseListController<News> , XLPagerTabStripChildItem {
    
    var flag: NewsListFlag = NewsListFlag.All
    
    init(flag: NewsListFlag) {
        self.flag = flag
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var prototypeCell: NewsCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.estimatedRowHeight = 88;
//        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.registerClass(NewsCell.self, forCellReuseIdentifier: "Cell")
        
        self.firstRefreshing()
        
        prototypeCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! NewsCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titleForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> String! {
        switch (flag) {
        case .All:
            return "TAB_NEWS_LIST_ALL".localized
        case .Industry:
            return "TAB_NEWS_LIST_INDUSTRY".localized
        case .Project:
            return "TAB_NEWS_LIST_PROJECT".localized
        }
    }
    
    func colorForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> UIColor! {
        return UIColor.whiteColor()
    }
    
    override func loadData(page: Int) {
        let success = {
            (data: [News]) -> Void in
            self.endRefreshing()
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
        // 1-所有|2-综合新闻|3-软件更新
        switch (flag) {
        case .All:
            ApiClient.newsList(page, catalog: 1, success: success, failure: failure)
            break
        case .Industry:
            ApiClient.newsList(page, catalog: 2,success: success, failure: failure)
            break
        case .Project:
            ApiClient.newsList(page, catalog: 3,success: success, failure: failure)
            break
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: NewsCell? = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? NewsCell
        if (cell == nil) {
            cell = NewsCell()
        }
        let news: News = self.dataSource[indexPath.row]
        
        cell!.bind(news)
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selected = false
        
        let controller: NewsDetailController = NewsDetailController()
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    var heights: [Int: CGFloat] = [:]
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

//        return UITableViewAutomaticDimension
        if let height = heights[indexPath.row] {
                    print("\(indexPath.row)|\(height)|heightForRowAtIndexPath")
            return height
        }
        print(">>>")
                let cell = prototypeCell
                let news = self.dataSource[indexPath.row]
                cell.bind(news)
                let height = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
        heights.updateValue(height, forKey: indexPath.row)
        return height
    }
    
//    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        print("\(indexPath.row)|estimatedHeightForRowAtIndexPath")
////        let cell = prototypeCell
////        let news = self.dataSource[indexPath.row]
////        cell.bind(news)
////        return cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
//        return UITableViewAutomaticDimension
//    }

}