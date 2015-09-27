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

class LoginController: BaseTableViewController {
    let CELL_USERNAME: String = "CELL_USERNAME"
    let CELL_PASSWORD: String = "CELL_PASSWORD"
    let CELL_LOGIN   : String = "CELL_LOGIN"
    
    var tfUsername: UITextField = UITextField()
    var tfPassword: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_LOGIN".localized
        let btnCancel: UIBarButtonItem = UIBarButtonItem(title: "ACTION_CANCEL".localized, style: .Plain, target: self, action: "close:")
        
        self.navigationItem.leftBarButtonItem = btnCancel
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
        
        self.tableView.registerClass(TextFieldCell.self, forCellReuseIdentifier: CELL_IDENTIFIER)
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
        switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
            case 0:
                let cell = TextFieldCell(reuseIdentifier: CELL_USERNAME)
                cell.textField.placeholder = "用户名"
                tfUsername = cell.textField
                return cell
            case 1:
                let cell = TextFieldCell(reuseIdentifier: CELL_PASSWORD)
                cell.textField.placeholder = "密码"
                cell.textField.secureTextEntry = true
                tfPassword = cell.textField
                return cell
            default:
                break
            }
            break
        case 1:
            let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL_LOGIN)
            cell.textLabel?.text = "登录"
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
        if (cell.reuseIdentifier == CELL_LOGIN) {
            tfUsername.text = "lijy91@foxmail.com"
            tfPassword.text = "w3DXHZ2MTWDmPv"
            login()
        }
    }
    
    func login() {
        let username: String = tfUsername.text!
        let password: String = tfPassword.text!
        ApiClient.login(username, password: password,
            success: {
                (data: User) -> Void in
                //
                HUD.show(self.view, message: "欢迎" + data.name!)
            },
            failure: {
                (code: Int, message: String) -> Void in
                //
                HUD.show(self.view, message: message)
            }
        )
    }
    
    func close(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
