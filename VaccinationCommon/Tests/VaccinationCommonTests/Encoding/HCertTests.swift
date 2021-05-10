//
//  HCertTests.swift
//
//
//  Copyright © 2021 IBM. All rights reserved.
//

@testable import VaccinationCommon

import Compression
import Foundation
import XCTest

class HCertTests: XCTestCase {
    var sut: HCert!
    var base45Encoder: Base45Coder!
    var cose1SignParser: CoseSign1Parser!

    override func setUp() {
        super.setUp()
        sut = HCert()
        base45Encoder = Base45Coder()
        cose1SignParser = CoseSign1Parser()
    }

    override func tearDown() {
        sut = nil
        base45Encoder = nil
        cose1SignParser = nil
        super.tearDown()
    }

//    func testVerifiy() {
//        let base45Decoded = try! base45Encoder.decode("6BFOXN*TS0BI$ZD4N9:9S6RCVN5+O30K3/XIV0W23NTDEMSCWNH$%PHD1PI0Z.28 FT522:6$T61R64IM646F9R2LE3/6X9ELTM P1TXMIO1ZV6C37Z01SVHLOEP*AY*9Q.9399Q$90C96KPB$PT1Q$E97C9-8E5T9*V9FQ5I%5ZY5Y7AMI5DN9QZ5Y0Q$UPE%5MZ5*T57ZA$O7T6LEJOA+MZ55EII-EBAFKD.SC3M4/B*IB*ZJ+7KYLDN4D74DVIJ8DBQPIOMI0OI-BC IEGFQWEB0C58EFXHJ$GJ-L84W17 98 9B+H$WMUF2IRI WUNO9PF7Q3BOT2Q:S1THP.H -HUVI3R92J99H5JUBRUQKPH$NA.RIQH5Z/JL$F%UGZP3+D4*P6ZPQSTL8VHC*J1%UDH8IRI/Q6-NEPUI03L-KG%7K08KHUB7VAKOJ P1IBGZIKRHH:D7X1MXETU I$Q5HJS-$SY6T80LO*4KWI7*KB:SC+P1+G SJOMILZI1MBPMI+ZJ49BJNJ0ECM8C:R1HTCMMSIL9T.V1-L9K16P7 6QZRJG/V%XN56SE0TY+4297ZAVR$V$2GN/N1W9-1K2*E29B*8MNSI$S1YLO$V7R40/ K809J:L AUEVM/WBXH1*20THGX0")
//
//        guard let decompressedPayload = Compression.decompress(Data(base45Decoded)) else {
//            XCTFail("Could not decompress QR Code data")
//            return
//        }
//        let cose1SignEncoder = CoseSign1Parser()
//        let cosePayload = try! cose1SignEncoder.parse(decompressedPayload)!
//        XCTAssertTrue(sut.verify(message: cosePayload, certificatePaths: ["dtrust_demo-bmg_seal_ubirch-02"]))
//    }
}