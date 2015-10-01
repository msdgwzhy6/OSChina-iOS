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

class Message: Mappable {
    var id: Int?             // 私信id
    var portrait: String?    // 私信人头像
    var friendid: Int?       // 接收人ID
    var friendname: String?  // 接收人用户名
    var senderid: Int?       // 发送者ID
    var sender: String?      // 发送者用户名
    var content: String?     // 私信内容
    var messageCount: Int?   // 来往私信数
    var pubDate: String?     // 私信发送日期

    init() { }

    required init?(_ map: Map){

    }

    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        portrait        <- map["portrait"]
        friendid        <- map["friendid"]
        friendname      <- map["friendname"]
        senderid        <- map["senderid"]
        sender          <- map["sender"]
        content         <- map["content"]
        messageCount    <- map["messageCount"]
        pubDate         <- map["pubDate"]
    }


    static func parse(element: ONOXMLElement?) -> Message? {
        if (element == nil) {
            return nil
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: Message = Message()

        data.id           = parser.integerValue("id")
        data.portrait     = parser.stringValue("portrait")
        data.friendid     = parser.integerValue("friendid")
        data.friendname   = parser.stringValue("friendname")
        data.senderid     = parser.integerValue("senderid")
        data.sender       = parser.stringValue("sender")
        data.content      = parser.stringValue("content")
        data.messageCount = parser.integerValue("messageCount")
        data.pubDate      = parser.stringValue("pubDate")

        return data
    }

    static func parseArray(element: ONOXMLElement?, needSort: Bool) -> [Message]? {
        if (element == nil) {
            return []
        }
        var list: [Message] = []
        for children in element!.children {
            list.append(parse(children as? ONOXMLElement)!)
        }
        if (needSort) {
            list.sortInPlace({ $0.pubDate > $1.pubDate })
        }
        return list
    }
}
