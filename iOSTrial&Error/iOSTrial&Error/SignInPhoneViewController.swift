//
//  SignInPhoneViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/19/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import UITextField_Shake
import DigitsKit



class SignInPhoneViewController: UIViewController {
    
    
    @IBOutlet weak var lastName: AkiraTextField!

    @IBOutlet weak var firstName: AkiraTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.newsChefWhiteColor()
        
    }

    @IBAction func onNextButtonTapped(_ sender: AnyObject) {
    
        if(firstName.text=="")
        {
            self.firstName.shake(20,withDelta: 7.0,speed: 0.03
            )
        }
        
        if(lastName.text=="")
        {
            self.lastName.shake(20,withDelta: 7.0,speed: 0.03
            )
        }
        if ((firstName.text != "") && (lastName.text != ""))
        {
            // Create a Digits appearance with Cannonball colors.
            let configuration = DGTAuthenticationConfiguration(accountFields: .defaultOptionMask)
            
            configuration?.appearance = DGTAppearance()
            configuration?.appearance.backgroundColor = UIColor.newsChefWhiteColor()
            configuration?.appearance.accentColor = UIColor.newsChefMainColor()
            
            Digits.sharedInstance().authenticate(with: nil, configuration:configuration!) { (session, error) in
                if session != nil {
                    // Navigate to the main app screen to select a theme.
                

                } else {
                    
                }
            }
        
        }
    }

}
