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
import XLPagerTabStrip

class QuestionController: XLBarPagerTabStripViewController {
    
    var btnPublishQuestion: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TITLE_QUESTION".localized

        self.btnPublishQuestion = UIBarButtonItem(title: "ACTION_PUBLISH_QUESTION".localized, style: .Plain, target: self, action: "publishQuestion:")
        self.navigationItem.rightBarButtonItem = btnPublishQuestion
    }

    override func childViewControllersForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> [AnyObject]! {
        let viewCOntroller1 = QuestionListController()
//        viewCOntroller1.view.backgroundColor = UIColor.redColor()
        let viewCOntroller2 = QuestionListController()
//        viewCOntroller2.view.backgroundColor = UIColor.grayColor()
        let viewCOntroller3 = QuestionListController()
//        viewCOntroller3.view.backgroundColor = UIColor.purpleColor()
        return [viewCOntroller1,viewCOntroller2,viewCOntroller3]
    }
    
    func publishQuestion(sender: UIBarButtonItem) {
        let controller: PublishQuestionController = PublishQuestionController(nibName: nil, bundle: nil)
        self.presentViewController(controller, animated: true)
    }
}
