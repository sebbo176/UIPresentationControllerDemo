//
//  PresentingViewController.swift
//  UIPresentationControllerDemo
//
//  Created by Sebastian Bolling on 2019-02-21.
//  Copyright © 2019 Sebastian Bolling. All rights reserved.
//

import UIKit

class PresentingViewController: UIViewController {
    
    let modalTransitionDelegate = ModalTransitionDelegate()
    
    @IBAction func presentModalViewControllerAction(_ sender: UIButton) {
        let presentedVC = PresentedViewController()
        presentedVC.modalPresentationStyle = .custom
        presentedVC.transitioningDelegate = modalTransitionDelegate
        present(presentedVC, animated: true, completion: nil)
    }
}
