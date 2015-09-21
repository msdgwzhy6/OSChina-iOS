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

class Comment: Mappable {
    var id: Int?                // 评论ID
    var content: String?        // 评论内容
    var pubDate: String?        // 发布日期
    var client_type: Int?       // 1-WEB、2-WAP、3-Android、4-IOS、5-WP
    var commentAuthor: String?  // 评论人
    var commentAuthorId: Int?   // 评论人ID
    var commentPortrait: Int?   // 评论人头像

//refers.refertitle	:String?	//评论中引用的标题
//refers.referbody	:String?	//评论中引用的内容
//replies.rauthor	:String?	//帖子中评论 评论 的人
//replies.rpubDate	datetime	//帖子中评论 评论 的时间
//replies.rauthorId	:Int?	//帖子中评论 评论 的人的ID
//replies.rcontent	:String?	//帖子中评论 评论 的内容

    required init?(_ map: Map){

    }

    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        content         <- map["content"]
        pubDate         <- map["pubDate"]
        client_type     <- map["client_type"]
        commentAuthor   <- map["commentAuthor"]
        commentAuthorId <- map["commentAuthorId"]
        commentPortrait <- map["commentPortrait"]
    }
}