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

class BaseMJRefreshTableViewController: UITableViewController {
    let CELL_IDENTIFIER: String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 下拉刷新
        let header = MJRefreshNormalHeader { () -> Void in
            self.tableView.footer.resetNoMoreData()
            self.loadData(0)
        }
        header.lastUpdatedTimeLabel!.hidden = true

        // 上拉加载
        let footer = MJRefreshAutoNormalFooter { () -> Void in
            var page: Int = 0
            let count = self.tableView(self.tableView, numberOfRowsInSection: 0)
            if (count > 0) {
                page = count / ApiClient.PAGE_SIZE
            }
            self.loadData(page)
        }
        self.tableView.header = header
        self.tableView.footer = footer
    }
    
    func loadData(page: Int) {
        delay(1, closure: {
            () -> () in
            self.endRefreshing()
        })
    }

    // MAKE: 默认进入下拉刷新状态，如需要进入上拉加载状态请使用self.tableView.footer.beginRefreshing()
    func beginRefreshing() {
        self.endRefreshing()
        self.tableView.header.beginRefreshing()
    }
    
    // MAKE: 默认会结束下拉刷新及上拉加载刷新状态
    func endRefreshing() {
        self.tableView.header.endRefreshing()
        self.tableView.footer.endRefreshing()
    }
}
