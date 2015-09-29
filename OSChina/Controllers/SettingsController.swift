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

class SettingsController: BaseTableViewController {
    let CELL_LOGOUT: String = "CELL_LOGOUT"

    var dataSource_: [Int:[Int:[String:String]]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_SETTINGS".localized

        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
        
        // section1
        addCell(0,row: 0,title: "消息通知",reuseIdentifier: "Cell")
        // section2
        addCell(1,row: 0,title: "评价此应用",reuseIdentifier: "Cell")
        addCell(1,row: 1,title: "应用版本",reuseIdentifier: "Cell")
        // section3
        addCell(2,row: 0,title: "推荐给朋友",reuseIdentifier: "Cell")
        addCell(2,row: 1,title: "意见与反馈",reuseIdentifier: "Cell")
        if (User.isLogged()) {
            addCell(3,row: 0,title: "退出登录",reuseIdentifier: CELL_LOGOUT)
        }
        print(dataSource_)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource_.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource_[section]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section:[Int:[String:String]] = dataSource_[indexPath.section]!
        let row:[String:String] = section[indexPath.row]!
        
        // 退出登录
        if (indexPath.section == 3) {
            let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL_LOGOUT)
            cell.textLabel?.text = "CELL_TEXT_LOGOUT".localized
            cell.textLabel?.textAlignment = .Center
            cell.textLabel?.textColor = UIColor.redColor()
            return cell
        } else {
            let cell = UITableViewCell(style: .Default, reuseIdentifier: row["reuseIdentifier"])
            cell.textLabel?.text = row["title"]
            cell.accessoryType = .DisclosureIndicator
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.selected = false
        if (cell.reuseIdentifier == CELL_LOGOUT) {
            logout()
        }
    }
    
    func logout() {
        User.current(nil)
    }

    func addCell(section: Int, row: Int, title: String, reuseIdentifier: String) {
        if (dataSource_[section] == nil) {
            dataSource_.updateValue([:], forKey: section)
        }
        let row_ = ["title": title, "reuseIdentifier": reuseIdentifier]
        dataSource_[section]?.updateValue(row_, forKey: row)
    }
}
