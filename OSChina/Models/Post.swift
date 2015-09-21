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

import Foundation
import ObjectMapper

class Post: Mappable {
    var id: Int?            // 帖子ID
    var pubDate: String?    // 发布时间
    var author: String?     // 发帖人
    var authorid: Int?      // 发帖人ID
    var body: String?       // 帖子内容
    var title: String?      // 帖子标题
    var favorite: Int?      // 是否收藏 1-收藏 0-未收藏
    var answerCount: Int?   // 回复数
    var viewCount: Int?     // 浏览数
    var portrait: String?   // 发帖人用户头像地址
    var url: String?        // 帖子链接
    var tags: [String]?     // 相关标签
    
    required init?(_ map: Map){
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        pubDate         <- map["pubDate"]
        author          <- map["author"]
        authorid        <- map["authorid"]
        body            <- map["body"]
        title           <- map["title"]
        favorite        <- map["favorite"]
        answerCount     <- map["answerCount"]
        viewCount       <- map["viewCount"]
        portrait        <- map["portrait"]
        url             <- map["url"]
        tags            <- map["tags"]
    }
}