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
    static func login(username: String, password: String) {
        let parameters: [String:AnyObject] = [
            "username": username,
            "pwd": password,
            "keep_login": 1
        ]
        Alamofire.request(.POST, URLs.LOGIN, parameters: parameters)
        .responseXMLDocument { (request, response, result) -> Void in
            let document: ONOXMLDocument = result.value!
//            print(document)
            var user = document.rootElement.firstChildWithTag("user") as! ONOXMLElement
            
            print(user.attributes)
            var data = document.rootElement.tag
            print(data)
            //append items
            var jsonObj = JSON(data)
            
            print(jsonObj)
            print(jsonObj[0])
        }
    }
}