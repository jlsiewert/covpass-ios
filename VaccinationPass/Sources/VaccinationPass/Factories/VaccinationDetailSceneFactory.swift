//
//  CertificateDetailSceneFactory.swift
//
//
//  Copyright © 2021 IBM. All rights reserved.
//

import UIKit
import PromiseKit
import VaccinationUI
import VaccinationCommon

struct VaccinationDetailSceneFactory: SceneFactory {
    // MARK: - Properties

    let router: VaccinationDetailRouterProtocol
    let repository: VaccinationRepositoryProtocol
    let certificates: [ExtendedCBORWebToken]

    // MARK: - Lifecylce

    init(
        router: VaccinationDetailRouterProtocol,
        repository: VaccinationRepositoryProtocol,
        certificates: [ExtendedCBORWebToken]) {

        self.router = router
        self.repository = repository
        self.certificates = certificates
    }

    func make() -> UIViewController {
        let viewModel = VaccinationDetailViewModel(
            router: router,
            repository: repository,
            certificates: certificates
        )
        let viewController = VaccinationDetailViewController.createFromStoryboard()
        viewController.viewModel = viewModel
        return viewController
    }
}
