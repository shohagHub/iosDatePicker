//
//  ViewController.swift
//  DateTimePicker
//
//  Created by Saleh Enam Shohag on 1/12/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goToObjcViewController(_ sender: UIButton) {
        let viewController = PickerObjcViewController.init(nibName: "PickerObjcViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

