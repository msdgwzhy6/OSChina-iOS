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

class PublishTweetController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnClose: UIBarButtonItem = UIBarButtonItem(title: "ACTION_CLOSE".localized, style: .Plain, target: self, action: "close:")
        
        self.navigationItem.leftBarButtonItem = btnClose
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func close(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}