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

class Result_ {
    
    func isSuccess() -> Bool {
        return errorCode == 1
    }
    
    var errorCode: Int? = 1
    var errorMessage: String? = ""
    
    init() { }
    
    required init?(_ map: Map){
        
    }
    
    // Mappable
    func mapping(map: Map) {
        errorCode            <- map["errorCode"]
        errorMessage         <- map["errorMessage"]
    }

    static func parse(element: ONOXMLElement?) -> Result_ {
        if (element == nil) {
            return Result_()
        }
        let parser: XmlParser = XmlParser(element: element!)
        let data: Result_ = Result_()
        
        data.errorCode    = parser.integerValue("errorCode")
        data.errorMessage = parser.stringValue("errorMessage")
        return data
    }
}
