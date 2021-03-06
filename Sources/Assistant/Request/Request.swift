//
//  Request.swift
//  SwiftyBot
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 - 2019 Fabrizio Brancati.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

/// Google Assistant request struct.
public struct Request: Codable {
    /// Unique ID for request.
    public private(set) var responseID: String
    /// Unique session ID.
    public private(set) var session: String
    /// Result of the conversation query or event processing.
    public private(set) var queryResult: QueryResult
    
    /// Coding keys, used by Codable protocol.
    private enum CodingKeys: String, CodingKey {
        case responseID = "responseId"
        case session
        case queryResult
    }
}

// MARK: - Intent Check Extension

/// Request extension.
public extension Request {
    /// Check if the request is a definied intent.
    ///
    /// - Parameter intent: Intent to be checked.
    /// - Returns: Returns `true` if is the checked intent, otherwise `false`.
    func `is`(intent: AvailableIntent) -> Bool {
        return queryResult.intent.displayName == intent.rawValue
    }
}
