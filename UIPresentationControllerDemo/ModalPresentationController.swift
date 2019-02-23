//
//  CustomPresentationController.swift
//  StandaloneAppTest
//
//  Created by Sebastian Bolling on 2019-02-21.
//  Copyright © 2019 Sebastian Bolling. All rights reserved.
//

import Foundation
import UIKit

class ModalPresentationController: UIPresentationController, UIAdaptivePresentationControllerDelegate {
    
    override init(presentedViewController: UIViewController, presenting: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presenting)
        setupbackgroundBlur()
        delegate = self
    }
    
    private var backgroundBlurView: UIView?
    

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let width: CGFloat = presentingViewController.view.frame.width * 0.6
        let height: CGFloat = presentingViewController.view.frame.height * 0.6
        let x: CGFloat = (presentingViewController.view.frame.width / 2) - (width / 2)
        let y: CGFloat = (presentingViewController.view.frame.height / 2) - (height / 2)
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    override func presentationTransitionWillBegin() {
        
        guard let backgroundBlurView = backgroundBlurView else { return }
        
        containerView?.insertSubview(backgroundBlurView, at: 0)
        NSLayoutConstraint.activate([
            backgroundBlurView.widthAnchor.constraint(equalTo: presentingViewController.view.widthAnchor, multiplier: 1),
            backgroundBlurView.heightAnchor.constraint(equalTo: presentingViewController.view.heightAnchor, multiplier: 1),
            backgroundBlurView.centerXAnchor.constraint(equalTo: presentingViewController.view.centerXAnchor),
            backgroundBlurView.centerYAnchor.constraint(equalTo: presentingViewController.view.centerYAnchor)
            ])
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            return backgroundBlurView.alpha = 1.0
        }
        
        coordinator.animate(alongsideTransition: { _ in
            backgroundBlurView.alpha = 1.0
        })
    }
    
    override func dismissalTransitionWillBegin() {
        guard let backgroundBlurView = backgroundBlurView else { return }
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            return backgroundBlurView.alpha = 0.0
        }
        
        coordinator.animate(alongsideTransition: { _ in
            backgroundBlurView.alpha = 0.0
        })
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController,
                                   traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        if traitCollection.verticalSizeClass == .compact {
            return .overFullScreen
        } else {
            return .none
        }
    }
}


@objc private extension ModalPresentationController {
    
    dynamic func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }
}


private extension ModalPresentationController {
    
    func setupbackgroundBlur() {
        backgroundBlurView = UIView()
        backgroundBlurView?.translatesAutoresizingMaskIntoConstraints = false
        backgroundBlurView?.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        backgroundBlurView?.alpha = 0.0
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        backgroundBlurView?.addGestureRecognizer(tapRecognizer)
    }
}
