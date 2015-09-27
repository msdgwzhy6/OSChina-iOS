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

class Tweet: Mappable {
    var id: Int?            // 动弹ID
    var pubDate: String?    // 动弹时间
    var body: String?       // 动弹内容
    var author: String?     // 发帖人
    var authorid: Int?      // 发帖人ID
    var imgSmall: String?   // 动弹小图
    var imgBig: String?     // 动弹大图
    var commentCount: Int?  // 评论数
    var portrait: String?   // 发帖人用户头像地址
    
    init() { }

    required init?(_ map: Map){

    }

    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        pubDate         <- map["pubDate"]
        body            <- map["body"]
        author          <- map["author"]
        authorid        <- map["authorid"]
        imgSmall        <- map["imgSmall"]
        imgBig          <- map["imgBig"]
        commentCount    <- map["commentCount"]
        portrait        <- map["portrait"]
    }
    
    
    static func parse(element: ONOXMLElement?) -> Tweet? {
        if (element == nil) {
            return nil
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: Tweet = Tweet()
        
        data.id           = parser.integerValue("id")
        data.pubDate      = parser.stringValue("pubDate")
        data.body         = parser.stringValue("body")
        data.author       = parser.stringValue("author")
        data.authorid     = parser.integerValue("authorid")
        data.imgSmall     = parser.stringValue("imgSmall")
        data.imgBig       = parser.stringValue("imgBig")
        data.commentCount = parser.integerValue("commentCount")
        data.portrait     = parser.stringValue("portrait")
        
        return data
    }
    
    static func parseArray(element: ONOXMLElement?) -> [Tweet]? {
        if (element == nil) {
            return []
        }
        var list: [Tweet] = []
        for children in element!.children {
//            print(children)
            list.append(parse(children as? ONOXMLElement)!)
        }
        list.sortInPlace({ $0.pubDate > $1.pubDate })
        return list
    }
}