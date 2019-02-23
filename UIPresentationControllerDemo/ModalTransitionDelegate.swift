//
//  ModalTransitionDelegate.swift
//  UIPresentationControllerDemo
//
//  Created by Sebastian Bolling on 2019-02-21.
//  Copyright © 2019 Sebastian Bolling. All rights reserved.
//

import Foundation
import UIKit

class ModalTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    public func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController) -> UIPresentationController? {
        return ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

