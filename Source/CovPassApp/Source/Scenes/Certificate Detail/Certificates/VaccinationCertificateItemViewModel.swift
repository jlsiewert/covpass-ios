//
//  VaccinationCertificateItemViewModel.swift
//
//
//  © Copyright IBM Deutschland GmbH 2021
//  SPDX-License-Identifier: Apache-2.0
//

import CovPassCommon
import CovPassUI
import Foundation
import UIKit

struct VaccinationCertificateItemViewModel: CertificateItemViewModel {
    private let certificate: ExtendedCBORWebToken
    private var dgc: DigitalGreenCertificate {
        certificate.vaccinationCertificate.hcert.dgc
    }

    private var formatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .ordinal
        return nf
    }

    private let active: Bool

    var icon: UIImage {
        if certificate.vaccinationCertificate.isExpired || certificate.vaccinationCertificate.isInvalid {
            return .expired
        }
        if certificate.vaccinationCertificate.expiresSoon {
            return .activity
        }
        return dgc.v?.first?.fullImmunization ?? false ? .statusFullDetail : .statusPartial
    }

    var iconColor: UIColor {
        if !active || certificate.vaccinationCertificate.isExpired || certificate.vaccinationCertificate.isInvalid {
            return .onBackground40
        }
        if dgc.v?.first?.fullImmunization ?? true == false {
            return .brandAccent
        }
        return .neutralWhite
    }

    var iconBackgroundColor: UIColor {
        if !active || certificate.vaccinationCertificate.isExpired || certificate.vaccinationCertificate.isInvalid {
            return .onBackground20
        }
        if dgc.v?.first?.fullImmunization ?? true == false {
            return .brandAccent20
        }
        return .brandAccent
    }

    var title: String {
        "certificates_overview_vaccination_certificate_title".localized
    }

    var titleAccessibilityLabel: String? { title }

    var subtitle: String {
        guard let v = dgc.v?.first else { return "" }
        return String(format: "certificates_overview_vaccination_certificate_message".localized, v.dn, v.sd)
    }

    var subtitleAccessibilityLabel: String? { subtitle }

    var info: String {
        if let v = dgc.v?.first {
            return String(format: "certificates_overview_vaccination_certificate_date".localized, DateUtils.displayDateFormatter.string(from: v.dt))
        }
        return ""
    }

    var infoAccessibilityLabel: String? {
        guard let v = dgc.v?.first else { return info }
        return String(format: "certificates_overview_vaccination_certificate_date".localized, DateUtils.audioDateFormatter.string(from: v.dt))
    }

    var info2: String? {
        if certificate.vaccinationCertificate.isExpired {
            return "certificates_overview_expired_certificate_note".localized
        }
        if certificate.vaccinationCertificate.expiresSoon {
            return "certificates_overview_expires_soon_certificate_note".localized
        }
        if certificate.vaccinationCertificate.isInvalid {
            return "certificates_overview_invalid_certificate_note".localized
        }
        return nil
    }

    var info2AccessibilityLabel: String? { info2 }

    var certificateItemIsSelectableAccessibilityLabel: String {
        "accessibility_overview_certificates_label_display_certificate".localized
    }

    var statusIcon: UIImage {
        .validationCheckmark
    }

    var statusIconAccessibilityLabel: String? { activeTitle }

    var activeTitle: String? {
        active ? "certificates_overview_currently_uses_certificate_note".localized : nil
    }

    init(_ certificate: ExtendedCBORWebToken, active: Bool = false) {
        self.certificate = certificate
        self.active = active
    }
}
