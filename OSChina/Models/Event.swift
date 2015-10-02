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

class Event: Mappable {
    var id: Int?            // 活动id
    var cover: String?      // 活动封面
    var title: String?      // 活动标题
    var url: String?        // 活动URL
    var startTime: String?  // 开始时间
    var endTime: String?    // 结束时间
    var createTime: String? // 创建时间
    var spot: String?       // 详细地址
    var city: String?       // 城市
    var status: Int?        // 状态
    var applyStatus: Int?   //

    init() { }
    
    required init?(_ map: Map){
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        cover           <- map["cover"]
        title           <- map["title"]
        url             <- map["url"]
        startTime       <- map["startTime"]
        endTime         <- map["endTime"]
        createTime      <- map["createTime"]
        spot            <- map["spot"]
        city            <- map["city"]
        status          <- map["status"]
        applyStatus     <- map["applyStatus"]
    }
    
    
    static func parse(element: ONOXMLElement?) -> Event? {
        if (element == nil) {
            return nil
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: Event = Event()
        
        data.id             = parser.integerValue("id")
        data.cover          = parser.stringValue("cover")
        data.title          = parser.stringValue("title")
        data.url            = parser.stringValue("url")
        data.startTime      = parser.stringValue("startTime")
        data.endTime        = parser.stringValue("endTime")
        data.createTime     = parser.stringValue("createTime")
        data.spot           = parser.stringValue("spot")
        data.city           = parser.stringValue("city")
        data.status         = parser.integerValue("status")
        data.applyStatus    = parser.integerValue("applyStatus")
        return data
    }
    
    static func parseArray(element: ONOXMLElement?, needSort: Bool) -> [Event]? {
        if (element == nil) {
            return []
        }
        var list: [Event] = []
        for children in element!.children {
            list.append(parse(children as? ONOXMLElement)!)
        }
        if (needSort) {
            list.sortInPlace({ $0.startTime > $1.startTime })
        }
        return list
    }
}
