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

class News: Mappable {
    var id: Int?            // 新闻id
    var author: String?     // 投递者名称
    var authorid: Int?      // 投递者编号
    var title: String?      // 新闻标题
    var body: String?       // 新闻内容
    var pubDate: String?    // 发布日期
    var commentCount: Int?  // 评论数
    var type: Int?          // 新闻类型 [0-链接新闻|1-软件推荐|2-讨论区帖子|3-博客|4-普通新闻|7-翻译文章]

    init() { }

    required init?(_ map: Map){

    }

    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        author          <- map["author"]
        authorid        <- map["authorid"]
        title           <- map["title"]
        body            <- map["body"]
        pubDate         <- map["pubDate"]
        commentCount    <- map["commentCount"]
        type            <- map["type"]
    }
    
    static func parse(element: ONOXMLElement?) -> News? {
        if (element == nil) {
            return nil
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: News = News()
        
        data.id           = parser.integerValue("id")
        data.author       = parser.stringValue("author")
        data.authorid     = parser.integerValue("authorid")
        data.title        = parser.stringValue("title")
        data.body         = parser.stringValue("body")
        data.pubDate      = parser.stringValue("pubDate")
        data.commentCount = parser.integerValue("commentCount")
        data.type         = parser.integerValue("type")
        
        return data
    }
    
    static func parseArray(element: ONOXMLElement?) -> [News]? {
        if (element == nil) {
            return []
        }
        var list: [News] = []
        for children in element!.children {
            list.append(parse(children as? ONOXMLElement)!)
        }
        list.sortInPlace({ $0.pubDate > $1.pubDate })
        return list
    }
}