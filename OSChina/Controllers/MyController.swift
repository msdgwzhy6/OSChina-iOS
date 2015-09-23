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

class MyController: UITableViewController {
    // header
    let CELL_MY_FOLLOWERS: String = "ID_CELL_MY_FOLLOWERS"
    let CELL_MY_FANS     : String = "ID_CELL_MY_FANS"
    // section 1
    let CELL_MY_TWEETS   : String = "ID_CELL_MY_TWEETS"
    let CELL_MY_BLOG     : String = "ID_CELL_MY_BLOG"
    let CELL_MY_FAVORITES: String = "ID_CELL_MY_FAVORITES"
    // section 2
    let CELL_MY_PROJECTS : String = "ID_CELL_MY_PROJECTS"
    let CELL_MY_TEAMS    : String = "ID_CELL_MY_TEAMS"

    var settingsController: SettingsController?

    var btnSettings: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSettings = UIBarButtonItem(title: "设置", style: .Plain, target: self, action: "clickSettings:")
        self.btnSettings?.tintColor = UIColor.whiteColor()
        // 设置NavigationBar
        self.navigationItem.title = "我的主页"
        self.navigationItem.rightBarButtonItem = btnSettings
        // 设置TableView
        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 2
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let header = UITableViewCell()
            header.textLabel?.text = "n/a"
            return header
        }

        var title: String = "";
        var identifier: String    = "";
        let cell = UITableViewCell()
        switch (indexPath.section) {
        case 1:
            switch (indexPath.row) {
            case 0:
                title = "我的动弹"
                identifier = CELL_MY_TWEETS
                break
            case 1:
                title = "我的博客"
                identifier = CELL_MY_BLOG
                break
            case 2:
                title = "我的收藏"
                identifier = CELL_MY_FAVORITES
                break
            default:
                break
            }
            break
        case 2:
            switch (indexPath.row) {
            case 0:
                title = "我的项目"
                identifier = CELL_MY_PROJECTS
                break
            case 1:
                title = "我的团队"
                identifier = CELL_MY_TEAMS
                break
            default:
                break
            }
            break
        default:
            break
        }
        cell.textLabel?.text = title
        cell.restorationIdentifier = identifier
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!

        switch (cell.restorationIdentifier!) {
        case CELL_MY_TWEETS:
            HUD.show(self.view, message: "我的动弹")
            break
        case CELL_MY_BLOG:
            HUD.show(self.view, message: "我的博客")
            break
        case CELL_MY_FAVORITES:
            HUD.show(self.view, message: "我的关注")
            break
        case CELL_MY_PROJECTS:
            HUD.show(self.view, message: "我的项目")
            break
        case CELL_MY_TEAMS:
            HUD.show(self.view, message: "我的团队")
            break
        default:
            break
        }
        cell.selected = false
    }

    func clickSettings(sender: UIBarButtonItem) {
        self.settingsController = SettingsController(nibName: nil, bundle: nil)
//        self.presentViewController(settingsController!, animated: true, completion: nil)
        self.navigationController?.pushViewController(settingsController!, animated: true)
    }
}