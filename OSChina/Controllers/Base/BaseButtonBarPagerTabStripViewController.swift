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

class BaseButtonBarPagerTabStripViewController: XLButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isProgressiveIndicator = true;
        self.buttonBarView.backgroundColor = UIColor.primaryButtonBarColor()
        self.buttonBarView.selectedBar.backgroundColor = UIColor.primaryColor()
        self.buttonBarView.selectedBarHeight = CGFloat(2)
        self.buttonBarView.registerNib(UINib(nibName: "ButtonBarViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(self.buttonBarView);
        self.view.backgroundColor = UIColor.whiteColor()

        self.changeCurrentIndexProgressiveBlock = {
            (oldCell: XLButtonBarViewCell?, newCell: XLButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) in Void.self            
            oldCell?.label.highlighted = false
            newCell?.label.highlighted = true
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = self.view.frame.width / CGFloat(self.pagerTabStripChildViewControllers.count)
        return CGSize(width: width, height: self.buttonBarView.frame.height)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

    func contentInset() -> UIEdgeInsets {
        return UIEdgeInsetsMake(self.buttonBarView.frame.height, 0, self.buttonBarView.frame.height + (self.tabBarController?.tabBar.frame.height)!, 0)
    }
    
    func scrollIndicatorInsets() -> UIEdgeInsets {
        return UIEdgeInsetsMake(self.buttonBarView.frame.height, 0, (self.tabBarController?.tabBar.frame.height)!, 0)
    }
}
