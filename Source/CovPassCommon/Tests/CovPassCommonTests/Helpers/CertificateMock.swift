//
//  CertificateMock.swift
//
//
//  © Copyright IBM Deutschland GmbH 2021
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct CertificateMock {
    static let validCertificate = "HC1:6BFOXN*TS0BI$ZD4N9:9S6RCVN5+O30K3/XIV0W23NTDE$VK G2EP4J0B3KL6QM5/OVGA/MAT%ISA3/-2E%5VR5VVBJZILDBZ8D%JTQOLC8CZ8DVCK/8D:8DQVDLED0AC-BU6SS-.DUBDNU347D8MS$ESFHDO8TF724QSHA2YR3JZIM-1U96UX4795L*KDYPWGO+9A*DOPCRFE4IWM:J8QHL9/5.+M1:6G16PCNQ+MLTMU0BR3UR:J.X0A%QXBKQ+8E/C5LG/69+FEKHG4.C/.DV2MGDIE-5QHCYQCJB4IE9WT0K3M9UVZSVK78Y9J8.P++9-G9+E93ZM$96TV6KJ73T59YLQM14+OP$I/XK$M8AO96YBDAKZ%P WUQRELS4J1T7OFKCT6:I /K/*KRZ43R4+*431TVZK WVR*GNS42J0+-9*+7E3KF%CD 810H% 0NY0H$1AVL9%7L26Y1NZ1WNZBPCG*7L%5G.%M/4GNIRDBE6J7DFUPSKX.MLEF8/72SEPKD++I*5FMHD*ZBJDBFKEG2GXTL6%7K7GK7QQ1C3H0A/LGIH"
    static let validCertificateNoPrefix = CertificateMock.validCertificate.stripPrefix()
    static let invalidCertificate = "6BF:XVTAOMEVT-VXI24H9STEWXMQRA6J668060BT4"
    static let invalidCertificateOldFormat = "6BFWZ8VIMDWR-53HT0+M981HE-IQ%8/MLK3OK$JZXDCGE+014R2NJADEJXDTJ7VLGVX0SB 9312D7155F2G70VAIFT4ILV:Q++L6%2NNKAA9-K56EOG:6ASTGBSDAOY4FI/AXBJ PN%%Q LUGEVRDDH4A*5KE6O15OO8LPMNC29JDFGZH/QAHKQ2LTXXSDMPJH4LPLK.PYYRZPR-J3PRBI*HO.NGDRI*EMJCT-J:2D8WAYHOM84G$7S67S44Z64WD3J34HRIZ60U9BHN2:GG$33GJAY7CN%K22BVZGI30/73X6613TK-A4W4HB8W$2 DOHTAZ$PJI8K 12620OL-98V.6TNADD54T8RKK.FISK6/69HGT698+VG0IEIK7CBKPICPHK5.8U27VG1S6B*HDM:A%IGWTC/-T$VE62H19OVT9ND4H7E6JKBOU9ED9.3PDKV$AFGW-AV3OOE6K$$IE525I00IAEQ06P3LFGL9C*IHT*K9XB7*F+TQD9UCGVFVTU9KT1P3COHK7-8TR%T$4WS6RDDWYC7:TDHDTI8T8X20ZST9W6.VQE9Y0GPDL6-37+8N+0Q1LLZBCA9OC0O7820"
    static let invalidCertificateInvalidSignature = "HC1:6BFV602G0/3WUWGSLKH47GO00IQ7EGFEDI-99CK7603XK4F30ZG.-F2F3W$K$-F1JC X8Y50.FK8ZKO/EZKEZ96446C56..DX%DZJCH/DTZ9 QE5$C .CJECQW5HXO*WOZED93DXKEW.CNWE.Y92OAGY82+8UB8-R7/0A1OA1C9K09UIAI3DA8D0EC*KE: CZ CI3DAWEG09DH8$B9+S9JPCT3E5JDOA7Q478465W5G*67:EDOL9WEQDD+Q6TW6FA7C466KCN9E%961A6DL6FA7D46.JCP9EJY8L/5M/5546.96VF6.JCBECB1A-:8$966469L6OF6VX6FVCPD0KQEPD0LVC6JD846Y96B464W5Y57UPC1JC 7B+ED 8DM9EQX56$C4WEOPCO8F8VCOPC*G72A6HS8MG7VH98ZA17ACG6VF64-APH9DY9H%6JIAGB92T9AG78*6V500FKOAVCTRIMO WTP34R%CDYRRTN4364K7P+TPY3O8NLHMW0L$VU7R4A7P5ZK/69HYLK%OB*9GZL:ZBTCR3EEOJ2GG5VTG$XO.ABNONJFTPCBS5OZ/7$6ELA7DM2GM6405GG8.GCF04+4CQ1SLPNJL8CJ3NMG SOYH3ZE8PBGZTTH/NV7AYTS%MD1 MW*JLES:GA31MNF8T54Q15MVV1CD$Z42RF.M5B*I-1LJ82ACUZXB*HA1HJQ2W1UK.1Q0JC1YLPER9XPXO36274Z1YMDUIHI4BYOH Z2$ U95EI$VEX7Z6Q:PL2LC8BW7INF5G29QXLTP+A833UD7TLGJFM MDM$IXP16HU/EUMW3*M0OC0 Q6L%8P:UF9I5P0T4SXEJO+VR1S"
}