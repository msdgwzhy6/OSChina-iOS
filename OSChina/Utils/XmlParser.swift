//
// Created by LiJianying on 15/9/27.
// Copyright (c) 2015 LiJianying. All rights reserved.
//

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
