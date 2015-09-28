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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_SETTINGS".localized

        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2 + (User.isLogged() ? 1 : 0)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 2
        case 1:
            return 3
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL_LOGOUT)
            return cell
        case 1:
            let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL_LOGOUT)
            return cell
        case 2:
            let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL_LOGOUT)
            cell.textLabel?.text = "CELL_TEXT_LOGOUT".localized
            cell.textLabel?.textAlignment = .Center
            cell.textLabel?.textColor = UIColor.redColor()
            return cell
        default:
            break
        }
        return UITableViewCell(style: .Default, reuseIdentifier: CELL_IDENTIFIER)
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

}
