//
//  PresentedViewController.swift
//  UIPresentationControllerDemo
//
//  Created by Sebastian Bolling on 2019-02-21.
//  Copyright © 2019 Sebastian Bolling. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
