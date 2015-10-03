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
import MJRefresh
import XLPagerTabStrip

// MAKE:
class BaseListController<T>: UITableViewController {
    
    init() {
        super.init(style: .Plain)
    }
    
    var tabStripViewController: XLButtonBarPagerTabStripViewController? = nil

    var btnLoading: UIButton = UIButton()
    var btnEmpty: UIButton = UIButton()
    var btnError: UIButton = UIButton()

    var dataSource: [T] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // 下拉刷新
        let header = MJRefreshNormalHeader { () -> Void in
            self.tableView.footer.resetNoMoreData()
            if (self.dataSource.count == 0) {
                self.btnLoading.hidden = false
                self.btnEmpty.hidden = true
                self.btnError.hidden = true
            } else {
                self.btnLoading.hidden = true
                self.btnEmpty.hidden = true
                self.btnError.hidden = true
            }
            self.loadData(0)
        }
        header.lastUpdatedTimeLabel!.hidden = true
        // 上拉加载
        let footer = MJRefreshAutoNormalFooter { () -> Void in
            self.loadData(self.page())
        }
        self.tableView.header = header
        self.tableView.footer = footer
        // 不显示多余的分割线
        self.tableView.tableFooterView = UIView()
        
        var btnFrame: CGRect = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: self.tableView.frame.height - self.tableView.contentInset.bottom)
        self.btnLoading.frame = btnFrame
//        self.btnLoading.backgroundColor = UIColor.blueColor()
        self.btnLoading.setTitleColor(UIColor.grayColor(), forState: .Normal)
        self.btnLoading.setTitle("Loading...", forState: .Normal)
        
        self.btnEmpty.frame = btnFrame
        //        self.btnEmpty.backgroundColor = UIColor.blueColor()
        self.btnEmpty.setTitleColor(UIColor.grayColor(), forState: .Normal)
        self.btnEmpty.setTitle("Empty", forState: .Normal)
        
        self.btnError.frame = btnFrame
        //        self.btnError.backgroundColor = UIColor.blueColor()
        self.btnError.setTitleColor(UIColor.grayColor(), forState: .Normal)
        self.btnError.setTitle("Error", forState: .Normal)

        self.view.addSubview(self.btnLoading)
        self.view.addSubview(self.btnEmpty)
        self.view.addSubview(self.btnError)
        
        self.btnLoading.hidden = true
        self.btnEmpty.hidden = true
        self.btnError.hidden = true
    }
    
    // MAKE: TableView数量默认为dataSource.count
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    // MAKE: 首次进入时刷新数据
    func firstRefreshing() {
        self.btnLoading.hidden = false
        self.btnEmpty.hidden = true
        self.btnError.hidden = true
        // 延时0.3秒后执行加载数据操作，延时是为了Loading不会因为加载速度过快造成一闪而过的不好体验
        self.delay(0.3) { () -> () in
            self.loadData(0)
        }
    }

    // MAKE: 默认进入下拉刷新状态，如需要进入上拉加载状态请使用self.tableView.footer.beginRefreshing()
    func beginRefreshing() {
        self.tableView.header.beginRefreshing()
    }
    
    // MAKE: 默认会结束下拉刷新及上拉加载刷新状态
    func endRefreshing() {
        if (self.tableView.header.isRefreshing()) {
            self.tableView.header.endRefreshing()
        }
        if (self.tableView.footer.isRefreshing()) {
            self.tableView.footer.endRefreshing()
        }
        // 通知MJRefresh是否未全部加载
        if (!self.hasMore()) {
            self.tableView.footer.noticeNoMoreData()
        }

        if (self.dataSource.count == 0) {
            self.btnLoading.hidden = true
            self.btnEmpty.hidden = false
            self.btnError.hidden = true
        } else {
            self.btnLoading.hidden = true
            self.btnEmpty.hidden = true
            self.btnError.hidden = true
        }
    }
    
    // MAKE: 加载数据
    func loadData(page: Int) {
        delay(1.5) { () -> () in
            self.endRefreshing()
        }
    }

    // MAKE: 当前页码（按照TableView的数量计算）
    func page() -> Int {
        let count = self.tableView(self.tableView, numberOfRowsInSection: 0)
        if (count > 0) {
            return count / pageSize()
        }
        return 0
    }
    
    // MAKE: 默认分页大小为ApiClient.PAGE_SIZE
    func pageSize() -> Int {
        return ApiClient.PAGE_SIZE
    }
    
    // MAKE: 数据是否已经加载完毕
    func hasMore() -> Bool {
        if (self.dataSource.count % self.pageSize() != 0 || (self.page() > 0 && self.dataSource.count == 0)) {
            return false
        }
        return true
    }
}
