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
    var atmeCount: Int? = 0 // 未读@我数
    var msgCount: Int? = 0   // 未读私信数
    var reviewCount: Int? = 0 //
    var newFansCount: Int? = 0  // 新增粉丝数
    var newLikeCount: Int? = 0  //
    
    init() { }
    
    required init?(_ map: Map){
        
    }
    
    // Mappable
    func mapping(map: Map) {
        atmeCount       <- map["atmeCount"]
        msgCount        <- map["msgCount"]
        reviewCount     <- map["reviewCount"]
        newFansCount    <- map["newFansCount"]
        newFansCount    <- map["newFansCount"]
    }
    
    static func parse(element: ONOXMLElement?) -> Notice {
        if (element == nil) {
            return Notice()
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: Notice = Notice()
        
        data.atmeCount     = parser.integerValue("atmeCount")
        data.msgCount      = parser.integerValue("msgCount")
        data.reviewCount   = parser.integerValue("reviewCount")
        data.newFansCount  = parser.integerValue("newFansCount")
        data.newFansCount  = parser.integerValue("newFansCount")
        return data
    }
}
