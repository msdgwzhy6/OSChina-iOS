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

import Ono

class XmlParser {
    var element: ONOXMLElement

    init(element: ONOXMLElement) {
        self.element = element
    }
    
    func numberValue(tag: String, defValue: NSNumber) -> NSNumber {
        if let child: ONOXMLElement = self.element.firstChildWithTag(tag) {
            return child.numberValue()
        }
        return defValue
    }

    func integerValue(tag: String, defValue: Int) -> Int {
        if let child: ONOXMLElement = self.element.firstChildWithTag(tag) {
            return child.numberValue().integerValue
        }
        return defValue
    }

    func integerValue(tag: String) -> Int {
        return integerValue(tag, defValue: 0)
    }
    
    func stringValue(tag: String, defValue: String) -> String {
        if let child: ONOXMLElement = self.element.firstChildWithTag(tag) {
            return child.stringValue()
        }
        return defValue
    }

    func stringValue(tag: String) -> String {
        return stringValue(tag, defValue: "")
    }
}
