//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Zach Ogden on 8/29/19.
//  Copyright © 2019 Zach Ogden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMessagedPressed(_ sender: Any) {
        messageLabel.text = "You Are Awesome!"
        
    }
    
}

