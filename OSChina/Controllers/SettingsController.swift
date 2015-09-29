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

    var dataSource: [Int:[Int:[String:String]]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_SETTINGS".localized

        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
        
        // section1
        addCell(0,row: 0,title: "a",reuseIdentifier: "b")
        addCell(0,row: 1,title: "a",reuseIdentifier: "b")
        // section2
        addCell(1,row: 0,title: "a",reuseIdentifier: "b")
        addCell(1,row: 1,title: "a",reuseIdentifier: "b")
        addCell(1,row: 2,title: "a",reuseIdentifier: "b")
        // section3
        addCell(2,row: 0,title: "a",reuseIdentifier: "b")
        addCell(2,row: 1,title: "a",reuseIdentifier: "b")
        if (User.isLogged()) {
            addCell(3,row: 3,title: "a",reuseIdentifier: "b")
        }
        print(dataSource)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section:[Int:[String:String]] = dataSource[indexPath.section]!
        let row:[String:String] = section[indexPath.row]!
        
        // 退出登录
        if (indexPath.section == 3) {
            let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL_LOGOUT)
            cell.textLabel?.text = "CELL_TEXT_LOGOUT".localized
            cell.textLabel?.textAlignment = .Center
            cell.textLabel?.textColor = UIColor.redColor()
        } else {
            let cell = UITableViewCell(style: .Default, reuseIdentifier: row["reuseIdentifier"])
            cell.textLabel?.text = row["title"]
            return cell
        }
        return UITableViewCell(style: .Default, reuseIdentifier: "Cell")
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
        if (dataSource[section] == nil) {
            dataSource.updateValue([:], forKey: section)
        }
        let row_ = ["title": title, "reuseIdentifier": reuseIdentifier]
        dataSource[section]?.updateValue(row_, forKey: row)
    }
}
