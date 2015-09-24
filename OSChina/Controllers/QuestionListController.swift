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

class QuestionListController: BaseTableViewController {
    
    var publishQuestionController: PublishQuestionController?
    
    var btnPublishQuestion: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnPublishQuestion = UIBarButtonItem(title: "提问", style: .Plain, target: self, action: "clickPublishQuestion:")
        self.btnPublishQuestion?.tintColor = UIColor.whiteColor()
        
        self.navigationItem.title = "问题"
        self.navigationItem.rightBarButtonItem = btnPublishQuestion
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clickPublishQuestion(sender: UIBarButtonItem) {
        self.publishQuestionController = PublishQuestionController(nibName: nil, bundle: nil)
        self.presentViewController(publishQuestionController!, animated: true, completion: nil)
    }

}