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

class Blog: Mappable {
    var id: Int?            // 博客id
    var title: String?      // 博客标题
    var body: String?       // 博客内容
    var pubDate: String?    // 发布日期
    var authorid: Int?      // 投递者编号
    var authorname: String? // 投递者名称
    var commentCount: Int?  // 评论数
    var documentType: Int?  // 1-原创 4-转载

    init() { }

    required init?(_ map: Map){

    }

    // Mappable
    func mapping(map: Map) {

    }
    
    static func parse(element: ONOXMLElement?) -> Blog? {
        if (element == nil) {
            return nil
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: Blog = Blog()
        
        data.id           = parser.integerValue("id")
        data.title        = parser.stringValue("title")
        data.body         = parser.stringValue("body")
        data.pubDate      = parser.stringValue("pubDate")
        data.authorid     = parser.integerValue("authorid")
        data.authorname   = parser.stringValue("authorname")
        data.commentCount = parser.integerValue("commentCount")
        data.documentType = parser.integerValue("documentType")
        
        return data
    }
    
    static func parseArray(element: ONOXMLElement?, needSort: Bool) -> [Blog]? {
        if (element == nil) {
            return []
        }
        var list: [Blog] = []
        for children in element!.children {
            list.append(parse(children as? ONOXMLElement)!)
        }
        if (needSort) {
            list.sortInPlace({ $0.pubDate > $1.pubDate })
        }
        return list
    }
}