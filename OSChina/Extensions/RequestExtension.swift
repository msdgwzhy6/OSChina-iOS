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

import Alamofire
import Ono

extension Request {
    public static func XMLResponseSerializer() -> GenericResponseSerializer<ONOXMLDocument> {
        return GenericResponseSerializer { request, response, data in
            guard let validData = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(data, error)
            }
            
            do {
                let XML = try ONOXMLDocument(data: validData)
                return .Success(XML)
            } catch let error as NSError {
                return .Failure(data, error)
            } catch {
                return .Failure(data, Error.errorWithCode(.DataSerializationFailed, failureReason: "Unknown error while parsing XML"))
            }
        }
    }
    
    public func responseXMLDocument(completionHandler: (NSURLRequest?, NSHTTPURLResponse?, Result<ONOXMLDocument>) -> Void) -> Self {
        return response(responseSerializer: Request.XMLResponseSerializer(), completionHandler: completionHandler)
    }
}
