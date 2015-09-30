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
import MessageUI

class SettingsController: BaseTableViewController, MFMailComposeViewControllerDelegate {
    
    let CELL_NOTIFICATION: String = "CELL_NOTIFICATION"
    let CELL_RATE_THIS_APP: String = "CELL_RATE_THIS_APP"
    let CELL_APP_VERSION: String = "CELL_APP_VERSION"
    let CELL_SHARE_THIS_APP: String = "CELL_SHARE_THIS_APP"
    let CELL_FEEDBACK: String = "CELL_FEEDBACK"
    let CELL_LOGOUT: String = "CELL_LOGOUT"

    var dataSource_: [Int:[Int:[String:String]]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_SETTINGS".localized

        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
        
        // section1
        addCell(0,row: 0,title: "消息通知",reuseIdentifier: CELL_NOTIFICATION)
        // section2
        addCell(1,row: 0,title: "评价此应用",reuseIdentifier: CELL_RATE_THIS_APP)
        addCell(1,row: 1,title: "应用版本",reuseIdentifier: CELL_APP_VERSION)
        // section3
        addCell(2,row: 0,title: "推荐给朋友",reuseIdentifier: CELL_SHARE_THIS_APP)
        addCell(2,row: 1,title: "意见与反馈",reuseIdentifier: CELL_FEEDBACK)
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
        }
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: row["reuseIdentifier"])
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = row["title"]
        switch (row["reuseIdentifier"]!) {
        case CELL_APP_VERSION:
            if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String {
                cell.detailTextLabel?.text = version
            }
            break;
        default:
            break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.selected = false
        switch (cell.reuseIdentifier!) {
        case CELL_NOTIFICATION:
            break
        case CELL_RATE_THIS_APP:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/app/1password-password-manager/id568903335")!)
            break
        case CELL_APP_VERSION:
            let controller: AboutController = AboutController()
            self.presentViewController(controller, animated: true, leftButtonType: .Close)
            break
        case CELL_SHARE_THIS_APP:
            let controller = UIActivityViewController(activityItems: ["OSChina", NSURL(string: "https://github.com/lijy91/OSChina-iOS")!], applicationActivities: nil)
            self.presentViewController(controller, animated: true, completion: nil)
            break
        case CELL_FEEDBACK:
            feedback()
            break
        case CELL_LOGOUT:
            logout()
            break
        default:
            break
        }
    }
    
    func feedback() {
        UIActionSheet.showInView(self.view,
            withTitle: nil,
            cancelButtonTitle: "取消",
            destructiveButtonTitle: nil,
            otherButtonTitles: ["告诉我们您喜欢的功能", "告诉我们您不喜欢的功能", "报告错误", "请求帮助"],
            tapBlock: {
                (actionSheet, buttonIndex) -> Void in
                if (buttonIndex != actionSheet.cancelButtonIndex) {
                    let controller = MFMailComposeViewController()
                    controller.mailComposeDelegate = self
                    controller.setSubject("feedback")
                    controller.setMessageBody("feedback", isHTML: true)
                    self.presentViewController(controller, animated: true, completion: nil)
                }
            }
        )
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logout() {
        UIActionSheet.showInView(self.view,
            withTitle: "是否确定要退出登录？",
            cancelButtonTitle: "取消",
            destructiveButtonTitle: "确定",
            otherButtonTitles: [],
            tapBlock: {
                (actionSheet, buttonIndex) -> Void in
                if (buttonIndex == actionSheet.destructiveButtonIndex) {
                    User.current(nil)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }
            }
        )
    }

    func addCell(section: Int, row: Int, title: String, reuseIdentifier: String) {
        
        if (dataSource_[section] == nil) {
            dataSource_.updateValue([:], forKey: section)
        }
        let row_ = ["title": title, "reuseIdentifier": reuseIdentifier]
        dataSource_[section]?.updateValue(row_, forKey: row)
    }
}
