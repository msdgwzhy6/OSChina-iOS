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

class DiscoveryController: BaseTableViewController {

    // section 1
    let CELL_ACTIVITIES         : String = "ID_CELL_ACTIVITIES"
    let CELL_ACTIVITIES_GO      : String = "ID_CELL_ACTIVITIES_GO"
    // section 2
    let CELL_OPEN_SOURCE_PROJECT: String = "ID_CELL_OPEN_SOURCE_PROJECT"
    let CELL_BLOG               : String = "ID_CELL_BLOG"
    
    var btnScanQRCode: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_DISCOVERY".localized
        self.btnScanQRCode = UIBarButtonItem(title: "ACTION_SCAN_QRCODE".localized, style: .Plain, target: self, action: "scanQRCode:")
        self.navigationItem.rightBarButtonItem = btnScanQRCode

        // 设置TableView
        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return 2
        case 1:
            return 2
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var title     : String = "";
        var identifier: String    = "";
        switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
            case 0:
                title = "线下活动"
                identifier = CELL_ACTIVITIES
                break
            case 1:
                title = "线下活动GO"
                identifier = CELL_ACTIVITIES
                break
            default:
                break
            }
            break
        case 1:
            switch (indexPath.row) {
            case 0:
                title = "开源项目"
                identifier = CELL_OPEN_SOURCE_PROJECT
                break
            case 1:
                title = "技术博客"
                identifier = CELL_BLOG
                break
            default:
                break
            }
            break
        default:
            break
        }
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CELL_IDENTIFIER)
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = title
        cell.restorationIdentifier = identifier
        cell.accessoryType = .DisclosureIndicator
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!

        switch (cell.restorationIdentifier!) {
        case CELL_ACTIVITIES:
            HUD.show(self.parentViewController!.view, message: "线下活动")
            break
        case CELL_ACTIVITIES_GO:
            HUD.show(self.view, message: "线下活动GO")
            break
        case CELL_OPEN_SOURCE_PROJECT:
            HUD.show(self.view, message: "开源项目")
            break
        case CELL_BLOG:
            HUD.show(self.view, message: "技术博客")
            break
        default:
            return
        }
        cell.selected = false
    }

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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func scanQRCode(sender: UIBarButtonItem) {
        let controller: ScanQRCodeController = ScanQRCodeController(nibName: nil, bundle: nil)
        self.presentViewController(controller, animated: true)
    }
}