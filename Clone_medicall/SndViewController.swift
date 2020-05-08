//
//  SndViewController.swift
//  Clone_medicall
//
//  Created by JU HAN LEE on 2020/05/08.
//  Copyright © 2020 yht. All rights reserved.
//

import Foundation
import UIKit

class SndViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
