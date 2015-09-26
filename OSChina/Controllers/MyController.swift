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
import SwiftyJSON
import ObjectMapper

class MyController: BaseTableViewController {
    // header
    let CELL_MY_PROFILE: String = "ID_CELL_PROFILE"
    let CELL_MY_FOLLOWERS: String = "ID_CELL_MY_FOLLOWERS"
    let CELL_MY_FANS: String = "ID_CELL_MY_FANS"
    // section 1
    let CELL_MY_TWEETS: String = "ID_CELL_MY_TWEETS"
    let CELL_MY_BLOG: String = "ID_CELL_MY_BLOG"
    let CELL_MY_FAVORITES: String = "ID_CELL_MY_FAVORITES"
    // section 2
    let CELL_MY_PROJECTS: String = "ID_CELL_MY_PROJECTS"
    let CELL_MY_TEAMS: String = "ID_CELL_MY_TEAMS"

    var settingsController: SettingsController?

    var btnSettings: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSettings = UIBarButtonItem(title: "设置", style: .Plain, target: self, action: "clickSettings:")
        self.btnSettings?.tintColor = UIColor.whiteColor()
        // 设置NavigationBar
        self.navigationItem.title = "TITLE_NEWS".localized

        self.navigationItem.rightBarButtonItem = btnSettings
        // 设置TableView
        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
        
        self.tableView.registerClass(MyProfileCell.self, forCellReuseIdentifier: CELL_MY_PROFILE)
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        navigationController?.navigationBar.shadowImage = UIImage();
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
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
            let profile: MyProfileCell = self.tableView.dequeueReusableCellWithIdentifier(CELL_MY_PROFILE) as! MyProfileCell
            profile.backgroundColor = UIColor(red: 0.255, green: 0.671, blue: 0.329, alpha: 1)
            profile.name.text = "痕迹"
            profile.separatorInset = UIEdgeInsetsMake(0, 0, 0, profile.bounds.size.width);
            return profile
        }

        var title: String = "";
        var identifier: String = "";
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
        let cell = UITableViewCell()
        cell.textLabel?.text = title
        cell.restorationIdentifier = identifier
        cell.accessoryType = .DisclosureIndicator
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!

        switch (cell.restorationIdentifier!) {
        case CELL_MY_TWEETS:
//            HUD.show(self.parentViewController!.view, message: "我的动弹")
            var data: [String: AnyObject] = [: ]
            data.updateValue(8, forKey: "uid")
            data.updateValue("痕迹", forKey: "name")
            data.updateValue("1", forKey: "gender")
            let user = Mapper<User>().map(data)
            print(user)
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

            ApiClient.login("lijy91@foxmail.com", password: "w3DXHZ2MTWDmPv")
            break
        default:
            return
        }
        cell.selected = false
    }
    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if (indexPath.section == 0) {
//            return 100;
//        }
//        return self.tableView(tableView, heightForRowAtIndexPath: indexPath)
//    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return CGFloat.min
        }
        return super.tableView(tableView, heightForHeaderInSection: section)
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            return nil
        }
        return super.tableView(tableView, viewForHeaderInSection: section)
    }

    func clickSettings(sender: UIBarButtonItem) {
        self.settingsController = SettingsController(nibName: nil, bundle: nil)
        self.settingsController!.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(settingsController!, animated: true)
    }
}