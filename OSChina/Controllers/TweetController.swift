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

class TweetController: XLTwitterPagerTabStripViewController {
    
    
    var publishTweetController: PublishTweetController?
    
    var btnPublishTweet: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isProgressiveIndicator = true;
        
        self.btnPublishTweet = UIBarButtonItem(title: "发表", style: .Plain, target: self, action: "clickPublishTweet:")
        self.btnPublishTweet?.tintColor = UIColor.whiteColor()
        
        //        self.navigationItem.title = "动弹"
        self.navigationItem.rightBarButtonItem = btnPublishTweet
        // Do any additional setup after loading the view.
        
//        self.buttonBarView.backgroundColor = UIColor.clearColor();
//        self.buttonBarView.selectedBar.backgroundColor=UIColor.orangeColor();
//        self.navigationController!.navigationBar.addSubview(self.buttonBarView);
//        self.view.addSubview(self.buttonBarView)
        
//        buttonBarView.registerNib(UINib(nibName: "NavTabButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
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
    
    
    
    func clickPublishTweet(sender: UIBarButtonItem) {
        self.publishTweetController = PublishTweetController(nibName: nil, bundle: nil)
        
        let tintColor: UIColor = UIColor(red: 0.255, green: 0.671, blue: 0.329, alpha: 1)
        
        let navController: UINavigationController = UINavigationController.init(rootViewController: publishTweetController!)
        navController.navigationBar.barStyle = UIBarStyle.Black
        navController.navigationBar.translucent = false
        navController.navigationBar.barTintColor = tintColor
        navController.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        navController.navigationBar.shadowImage = nil
        
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
}
