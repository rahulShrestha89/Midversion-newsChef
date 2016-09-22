//
//  AccountViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/22/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import DigitsKit

class AccountViewController: UIViewController {

    @IBAction func onSignOutButtonTapped(_ sender: AnyObject) {
        
        Digits.sharedInstance().logOut()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
