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

class Project: Mappable {
    var id: Int?                // 软件编号
    var title: String?          // 软件名称
    var url: String?            // 软件详情地址
    var extensionTitle: String? // 软件详情页标题
    var license: String?        // 软件类型
    var body: String?           // 软件详情内容
    var homepage: String?       // 软件主页链接
    var document: String?       // 软件文档链接
    var download: String?       // 软件下载链接
    var logo: String?           // 软件logo地址
    var languages: String?      // 软件语言类型
    var os: String?             // 软件操作系统
    var recordtime:String?      // 登记时间
    var favorite:Int?           // 是否收藏 1-收藏 0-未收藏

    required init?(_ map: Map){

    }

    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        url             <- map["url"]
        extensionTitle  <- map["extensionTitle"]
        license         <- map["license"]
        body            <- map["body"]
        homepage        <- map["homepage"]
        document        <- map["document"]
        download        <- map["download"]
        logo            <- map["logo"]
        languages       <- map["languages"]
        os              <- map["os"]
        recordtime      <- map["recordtime"]
        favorite        <- map["favorite"]
    }
}