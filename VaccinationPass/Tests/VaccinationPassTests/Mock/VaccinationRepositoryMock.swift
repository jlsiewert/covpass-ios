//
//  VaccinationRepositoryMock.swift
//  
//
//  Copyright © 2021 IBM. All rights reserved.
//

import VaccinationCommon
import PromiseKit

public struct VaccinationRepositoryMock: VaccinationRepositoryProtocol {
    public func getVaccinationCertificateList() -> Promise<VaccinationCertificateList> {
        return Promise.value(VaccinationCertificateList(certificates: []))
    }

    public func saveVaccinationCertificateList(_ certificateList: VaccinationCertificateList) -> Promise<VaccinationCertificateList> {
        return Promise.value(VaccinationCertificateList(certificates: []))
    }

    public func refreshValidationCA() -> Promise<Void> {
        return Promise.value(())
    }

    public func scanVaccinationCertificate(_ data: String) -> Promise<ExtendedVaccinationCertificate> {
        return Promise { seal in
            seal.reject(ApplicationError.unknownError)
        }
    }

    public func reissueValidationCertificate(_ certificate: ExtendedVaccinationCertificate) -> Promise<ExtendedVaccinationCertificate> {
        return Promise { seal in
            seal.reject(ApplicationError.unknownError)
        }
    }

    public func checkValidationCertificate(_ data: String) -> Promise<ValidationCertificate> {
        return Promise { seal in
            seal.reject(ApplicationError.unknownError)
        }
    }
}
