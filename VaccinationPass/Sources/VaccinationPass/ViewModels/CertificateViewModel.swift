//
//  CertificateViewModel.swift
//
//
//  Copyright © 2021 IBM. All rights reserved.
//

import UIKit
import VaccinationUI
import VaccinationCommon

public protocol CertificateViewModel: HeadlineViewModel {
    var delegate: ViewModelDelegate? { get }
    var addButtonImage: UIImage? { get }
    var certificates: [BaseCertifiateConfiguration] { get set }
    func process(payload: String, completion: @escaping ((ExtendedVaccinationCertificate?, Error?) -> Void))
    func configure<T: CellConfigutation>(cell: T, at indexPath: IndexPath)
    func reuseIdentifier(for indexPath: IndexPath) -> String
    func detailViewModel(_ indexPath: IndexPath) -> VaccinationDetailViewModel?
    func loadCertificatesConfiguration()
}