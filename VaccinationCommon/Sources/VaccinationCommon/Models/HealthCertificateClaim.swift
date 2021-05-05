//
//  HealthCertificateClaim.swift
//  
//
//  Copyright © 2021 IBM. All rights reserved.
//

import Foundation

public struct HealthCertificateClaim: Codable {
    // the digital green certificate
    public var dgc: DigitalGreenCertificate

    enum CodingKeys: String, CodingKey {
        case dgc = "1"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dgc = try values.decode(DigitalGreenCertificate.self, forKey: .dgc)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dgc, forKey: .dgc)
    }
}


