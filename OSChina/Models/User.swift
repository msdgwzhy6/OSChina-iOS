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

class User: Mappable {
    var uid: Int?               // 用户id
    var name: String?           // 用户名称
    var ident: String?          // 用户Ident
    var gender: Int?            // 性别：1-男，2-女
    var relation: Int?          // 关注情况：1-已关注（对方未关注我）2-相互关注 3-未关注
    var province: String?       // 省份
    var city: String!           // 城市
    var platforms: [String]?    // 开发平台
    var expertise: [String]?    // 专长领域
    var joinTime: String?       // 加入时间
    var lastLoginTime: String?  // 最近登录时间
    var portrait: String?       // 头像

    init() { }

    required init?(_ map: Map){

    }

    // Mappable
    func mapping(map: Map) {
        uid             <- map["uid"]
        name            <- map["name"]
        ident           <- map["ident"]
        gender          <- map["gender"]
        relation        <- map["relation"]
        province        <- map["province"]
        city            <- map["city"]
        platforms       <- map["platforms"]
        expertise       <- map["expertise"]
        joinTime        <- map["joinTime"]
        lastLoginTime   <- map["lastLoginTime"]
        portrait        <- map["portrait"]
    }
}
