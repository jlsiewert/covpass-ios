//
//  String+Escaping.swift
//
//
//  © Copyright IBM Deutschland GmbH 2021
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

public extension String {

    var sanitizedFileName: String {
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: "-._")
        return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet) ?? self
    }

    var sanitizedXMLString: String {
        var escaped = self
        escaped = escaped.replacingOccurrences(of: "&", with: "&amp;")
        escaped = escaped.replacingOccurrences(of: "<", with: "&lt;")
        escaped = escaped.replacingOccurrences(of: ">", with: "&gt;")
        escaped = escaped.replacingOccurrences(of: "\"", with: "&quot;")
        escaped = escaped.replacingOccurrences(of: "'", with: "&apos;")
        return escaped
    }
}