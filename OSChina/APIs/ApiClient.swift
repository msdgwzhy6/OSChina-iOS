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

import Alamofire
import SwiftyJSON
import Ono

class ApiClient {
    static let PAGE_SIZE: Int = 20

    static func login(username: String, password: String, success: (data: User) -> Void, failure: (code: Int, message: String) -> Void) {
        let parameters: [String:AnyObject] = [
                "username": username,
                "pwd": password,
                "keep_login": 1
        ]
        Alamofire.request(.POST, URLs.LOGIN, parameters: parameters)
        .responseXMLDocument {
            (request, response, result) -> Void in
            let rootElement: ONOXMLElement = result.value!.rootElement
            print(rootElement)
            let ret: Result_ = Result_.parse(rootElement.firstChildWithTag("result"))
            if (ret.isSuccess()) {
                let user: User = User.parse(rootElement.firstChildWithTag("user"))
                User.current(user)
                success(data: user)
            } else {
                failure(code: ret.errorCode!, message: ret.errorMessage!)
            }
        }
    }
    
    
    
    static func tweetListHot(page: Int, success: (data:[Tweet]) -> Void, failure: (code:Int, message:String) -> Void) {
        let parameters: [String: AnyObject] = [
            "pageIndex": page,
            "pageSize": PAGE_SIZE
        ]
        Alamofire.request(.POST, URLs.TWEET_TOPIC_LIST, parameters: parameters)
            .responseXMLDocument {
                (request, response, result) -> Void in
                let rootElement: ONOXMLElement = result.value!.rootElement
                let ret: Result_ = Result_.parse(rootElement.firstChildWithTag("result"))
                if (ret.isSuccess()) {
                    success(data: Tweet.parseArray(rootElement.firstChildWithTag("tweets"))!)
                } else {
                    failure(code: ret.errorCode!, message: ret.errorMessage!)
                }
        }
    }

    static func newsList(page: Int, catalog: Int, success: (data:[News]) -> Void, failure: (code:Int, message:String) -> Void) {
        
        let parameters: [String: AnyObject] = [
                "catalog": catalog,
                "pageIndex": page,
                "pageSize": PAGE_SIZE
        ]
        Alamofire.request(.POST, URLs.NEWS_LIST, parameters: parameters)
        .responseXMLDocument {
            (request, response, result) -> Void in
            let rootElement: ONOXMLElement = result.value!.rootElement
            let ret: Result_ = Result_.parse(rootElement.firstChildWithTag("result"))
            if (ret.isSuccess()) {
                success(data: News.parseArray(rootElement.firstChildWithTag("newslist"))!)
            } else {
                failure(code: ret.errorCode!, message: ret.errorMessage!)
            }
        }
    }

    static func tweetListLatest(page: Int, success: (data:[Tweet]) -> Void, failure: (code:Int, message:String) -> Void) {
        let parameters: [String:AnyObject] = [
                "pageIndex": page,
                "pageSize": PAGE_SIZE
        ]
        Alamofire.request(.POST, URLs.TWEET_LIST, parameters: parameters)
        .responseXMLDocument {
            (request, response, result) -> Void in
            let rootElement: ONOXMLElement = result.value!.rootElement
            let ret: Result_ = Result_.parse(rootElement.firstChildWithTag("result"))
            if (ret.isSuccess()) {
                success(data: Tweet.parseArray(rootElement.firstChildWithTag("tweets"))!)
            } else {
                failure(code: ret.errorCode!, message: ret.errorMessage!)
            }
        }
    }
}