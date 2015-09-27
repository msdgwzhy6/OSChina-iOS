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

enum QuestionListFlag {
    case _1
    case _2
    case _3
    case _4
}

class QuestionListController: BaseTableViewController, XLPagerTabStripChildItem  {
    
    
    var flag: QuestionListFlag = QuestionListFlag._1
    
    init(flag: QuestionListFlag) {
        self.flag = flag
        super.init(style: .Plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var btnPublishQuestion: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnPublishQuestion = UIBarButtonItem(title: "提问", style: .Plain, target: self, action: "publishQuestion:")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titleForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> String! {
        switch (flag) {
        case ._1:
            return "TAB_QUESTION_LIST_1".localized
        case ._2:
            return "TAB_QUESTION_LIST_2".localized
        case ._3:
            return "TAB_QUESTION_LIST_3".localized
        case ._4:
            return "TAB_QUESTION_LIST_4".localized
        }
    }
    
    func publishQuestion(sender: UIBarButtonItem) {
        let controller: PublishQuestionController = PublishQuestionController(nibName: nil, bundle: nil)
        self.presentViewController(controller, animated: true)
    }

}