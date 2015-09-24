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

class DiscoveryController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "发现"
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "refreshTable")
        header.lastUpdatedTimeLabel!.hidden = true
//        header.setTitle("Pull down to refresh", forState: MJRefreshStateIdle)
//        header.setTitle("Release to refresh", forState: MJRefreshStatePulling)
//        header.setTitle("Loading ...", forState: MJRefreshStateRefreshing)
        self.tableView.header = header
        self.tableView.header.beginRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTable() {
        delay(1, closure: { () -> () in
            self.tableView.header.endRefreshing()
            self.tableView.reloadData()
        })
    }
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}