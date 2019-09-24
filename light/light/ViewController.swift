//
//  ViewController.swift
//  light
//
//  Created by pete wurster on 9/15/19.
//  Copyright © 2019 pete wurster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushit(_ sender: Any) {
        lightOn.toggle()
        if lightOn == true {
            view.backgroundColor = .white
        }else{
            view.backgroundColor = .blue
        }
    }
    
}

