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

class TweetController: XLButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isProgressiveIndicator = true;
        // Do any additional setup after loading the view.
        
        self.buttonBarView.backgroundColor = UIColor.clearColor();
        self.buttonBarView.selectedBar.backgroundColor=UIColor.orangeColor();
        self.navigationController!.navigationBar.addSubview(self.buttonBarView);
        
        
        buttonBarView.registerNib(UINib(nibName: "NavTabButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        //add tab strip
//        navigationController!.navigationBar.addSubview(btnFavorites)
//        navigationController!.navigationBar.insertSubview(buttonBarView, belowSubview: btnFavorites)

    }

    override func childViewControllersForPagerTabStripViewController(pagerTabStripViewController: XLPagerTabStripViewController!) -> [AnyObject]! {
        let viewCOntroller1 = TweetListController()
//        viewCOntroller1.view.backgroundColor = UIColor.redColor()
        let viewCOntroller2 = TweetListController()
//        viewCOntroller2.view.backgroundColor = UIColor.grayColor()
        let viewCOntroller3 = TweetListController()
//        viewCOntroller3.view.backgroundColor = UIColor.purpleColor()
        return [viewCOntroller1, viewCOntroller2, viewCOntroller3]
    }
}
