//
//  SignInPhoneViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/19/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import UITextField_Shake



class SignInPhoneViewController: UIViewController {
    @IBOutlet weak var lastName: AkiraTextField!

    @IBOutlet weak var firstName: AkiraTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onNextButtonTapped(_ sender: AnyObject) {
    
        if(firstName.text=="")
        {
            self.firstName.shake(20,                              withDelta: 7.0,
                                     speed: 0.03
            )
        }
        
        if(lastName.text=="")
        {
            self.lastName.shake(20,                              withDelta: 7.0,
                                 speed: 0.03
            )
        }
    }

}
