//
// Created by LiJianying on 15/9/27.
// Copyright (c) 2015 LiJianying. All rights reserved.
//

import Foundation

class AboutController: BaseTableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_ABOUT".localized

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
        switch (section) {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

}
