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

import ObjectMapper
import Ono

class Notice: Mappable {
    var replyCount: Int? = 0 // 未读评论数
    var msgCount: Int? = 0   // 未读私信数
    var fansCount: Int? = 0  // 新增粉丝数
    var referCount: Int? = 0 // 未读@我数
    
    
    init() { }
    
    required init?(_ map: Map){
        
    }
    
    // Mappable
    func mapping(map: Map) {
        replyCount       <- map["replyCount"]
        msgCount         <- map["msgCount"]
        fansCount        <- map["fansCount"]
        referCount       <- map["referCount"]
    }
    
    static func parse(element: ONOXMLElement?) -> Notice {
        if (element == nil) {
            return Notice()
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: Notice = Notice()
        
        data.replyCount  = parser.integerValue("replyCount")
        data.msgCount    = parser.integerValue("msgCount")
        data.fansCount   = parser.integerValue("fansCount")
        data.referCount  = parser.integerValue("referCount")
        return data
    }
}
