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
import OnePasswordExtension

class LoginController: BaseTableViewController {
    let CELL_USERNAME: String = "CELL_USERNAME"
    let CELL_PASSWORD: String = "CELL_PASSWORD"
    let CELL_LOGIN   : String = "CELL_LOGIN"
    
    var tfUsername: UITextField = UITextField()
    var tfPassword: UITextField = UITextField()
    var btnOnepassword: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_LOGIN".localized
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
        
        self.tableView.registerClass(TextFieldCell.self, forCellReuseIdentifier: CELL_IDENTIFIER)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        if OnePasswordExtension.sharedExtension().isAppExtensionAvailable() == false {
//            let alertController = UIAlertController(title: "1Password is not installed", message: "Get 1Password from the App Store", preferredStyle: UIAlertControllerStyle.Alert)
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//            alertController.addAction(cancelAction)
//            
//            let OKAction = UIAlertAction(title: "Get 1Password", style: .Default) { (action) in UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/app/1password-password-manager/id568903335")!)
//            }
//            
//            alertController.addAction(OKAction)
//            self.presentViewController(alertController, animated: true, completion: nil)
//        }
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
                tfUsername.returnKeyType = .Next
                tfUsername.addTarget(self, action: "usernameFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
                
                // 添加onepassword按钮
                if (OnePasswordExtension.sharedExtension().isAppExtensionAvailable()) {
                    self.btnOnepassword.setBackgroundImage(UIImage(named: "onepassword-button"), forState: UIControlState.Normal)
                    self.btnOnepassword.addTarget(self, action: Selector("onepassword:"), forControlEvents: .TouchUpInside)
                    cell.textField.addSubview(btnOnepassword)
                    self.btnOnepassword.snp_makeConstraints {
                        (make) -> Void in
                        make.right.equalTo(cell.textField)
                        make.centerY.equalTo(cell.textField)
                    }
                }
                return cell
            case 1:
                let cell = TextFieldCell(reuseIdentifier: CELL_PASSWORD)
                
                cell.textField.placeholder = "密码"
                cell.textField.secureTextEntry = true
                tfPassword = cell.textField
                tfPassword.returnKeyType = .Send
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
    
    func onepassword(sender: UIButton!) {
        OnePasswordExtension.sharedExtension().findLoginForURLString(URLs.baseURL, forViewController: self, sender: sender, completion: { (loginDictionary, error) -> Void in
            if loginDictionary == nil {
                if error!.code != Int(AppExtensionErrorCodeCancelledByUser) {
                    print("Error invoking 1Password App Extension for find login: \(error)")
                }
                return
            }
            
            self.tfUsername.text = loginDictionary?[AppExtensionUsernameKey] as? String
            self.tfPassword.text = loginDictionary?[AppExtensionPasswordKey] as? String
            // 判断是否隐藏1password按钮
            self.usernameFieldDidChange(self.tfUsername)
        })
    }
    
    func usernameFieldDidChange(textField: UITextField) {
        btnOnepassword.hidden = textField.text?.characters.count != 0
    }
}
