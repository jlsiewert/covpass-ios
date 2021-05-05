//
//  OnboardingContainerViewController.swift
//  
//
//  Copyright © 2021 IBM. All rights reserved.
//

import UIKit

enum OnboardingError: Error {
    case closeError
}

public class OnboardingContainerViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var toolbarView: CustomToolbarView!
    @IBOutlet var pageIndicator: DotPageIndicator!
    
    // MARK: - Public Properties

    public var viewModel: OnboardingContainerViewModel?
    
    // MARK: - Internal Properties
    
    var pageController: UIPageViewController?
    var pages: [UIViewController] = []
    var currentIndex: Int = 0

    // MARK: - Lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = viewModel, viewModel.items.count > 0 else {
            fatalError("ViewModel should contain at least one page")
        }

        viewModel.items.forEach { model in
            var controller: UIViewController
            if model.type == .page4 {
                controller = ConsentViewController.createFromStoryboard(bundle: UIConstants.bundle)
                (controller as? ConsentViewController)?.viewModel = model
            } else {
                controller = OnboardingPageViewController.createFromStoryboard(bundle: UIConstants.bundle)
                (controller as? OnboardingPageViewController)?.viewModel = model
            }
            pages.append(controller)
        }
        configureToolbarView()
        configurePageIndicator()
        configurePageController()
    }

    // MARK: - Private

    private func configureToolbarView() {
        toolbarView.state = .confirm(viewModel?.startButtonTitle ?? "Los geht's")
        toolbarView.setUpLeftButton(leftButtonItem: .navigationArrow)
        toolbarView.delegate = self
    }

    private func configurePageIndicator() {
        pageIndicator.numberOfDots = pages.count
        pageIndicator.delegate = self
    }

    private func configurePageController() {
        pageController = children.first as? UIPageViewController
        pageController?.dataSource = self
        pageController?.delegate = self
        pageController?.setViewControllers([pages[currentIndex]], direction: .forward, animated: false, completion: nil)
    }
}

// MARK: - UIPageViewControllerDataSource

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController),
              index > 0 else { return nil }

        return pages[index - 1]
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController),
              index < pages.count - 1 else { return nil }

        return pages[index + 1]
    }
}

// MARK: - UIPageViewControllerDelegate

extension OnboardingContainerViewController: UIPageViewControllerDelegate {
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentViewController = pageViewController.viewControllers?.first,
              let index = pages.firstIndex(of: currentViewController) else { return }

        currentIndex = index
        pageIndicator.selectDot(withIndex: index)
    }
}

// MARK: - DotPageIndicatorDelegate

extension OnboardingContainerViewController: DotPageIndicatorDelegate {
    public func dotPageIndicator(_ dotPageIndicator: DotPageIndicator, didTapDot index: Int) {
        guard index != currentIndex, index >= 0, index < pages.count else { return }

        let direction: UIPageViewController.NavigationDirection = index > currentIndex ? .forward : .reverse
        pageController?.setViewControllers([pages[index]], direction: direction, animated: true, completion: nil)
        currentIndex = index
    }
}

// MARK: - CustomToolbarViewDelegate

extension OnboardingContainerViewController: CustomToolbarViewDelegate {
    public func customToolbarView(_: CustomToolbarView, didTap buttonType: ButtonItemType) {
        switch buttonType {
        case .navigationArrow:
            guard currentIndex-1 >= 0 else {
                viewModel?.navigateToPreviousScene()
                return
            }
            currentIndex -= 1
            pageController?.setViewControllers([pages[currentIndex]], direction: .reverse, animated: true, completion: nil)
            pageIndicator.selectDot(withIndex: currentIndex)
        case .textButton:
            guard currentIndex+1 < pages.count else {
                viewModel?.navigateToNextScene()
                return
            }
            currentIndex += 1
            pageController?.setViewControllers([pages[currentIndex]], direction: .forward, animated: true, completion: nil)
            pageIndicator.selectDot(withIndex: currentIndex)
        default:
            return
        }
    }
}

// MARK: - CheckboxViewDelegate

extension OnboardingContainerViewController: CheckboxViewDelegate {
    public func didSelectCheckboxView(_ state: Bool) {
        toolbarView.state = state ? .confirm(viewModel?.confirmButtonTitle ?? "Bestätigen") : .disabledWithText(viewModel?.confirmButtonTitle ?? "Bestätigen")
    }
}

// MARK: - StoryboardInstantiating

extension OnboardingContainerViewController: StoryboardInstantiating {
    public static var storyboardName: String {
        return UIConstants.Storyboard.Onboarding
    }
}
