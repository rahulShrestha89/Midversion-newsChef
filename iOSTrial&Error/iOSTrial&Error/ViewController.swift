//
//  ViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/7/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import Crashlytics


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: UIButtonType.RoundedRect)
        button.frame = CGRectMake(20, 50, 100, 30)
        button.setTitle("Crash", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)

    }

    @IBAction func crashButtonTapped(sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    }



}

