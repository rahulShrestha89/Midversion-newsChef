//
//  LandingPageViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/11/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import DigitsKit


class LandingPageViewController: UIViewController {
    
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
 
    @IBOutlet weak var lookAroundButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decorateButton(signInButton, color: UIColor.newsChefGreenColor())
        
        decorateButton(lookAroundButton, color: UIColor.newsChefBlueColor())
        
    }

    @IBAction func onPrivacyPolicyButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showPrivacyPolicy", sender: self)
    }
    
    @IBAction func onLookAroundButtonPressed(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showLookAround", sender: self)
    }

    @IBAction func onSignInButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showSignInView", sender: self)
    }
    
    // this refers to the unwind segue from other controllers
    // use this to unwind back
    @IBAction func unWindToLandingPage (segue : UIStoryboardSegue){
    }
}



private func decorateButton(_ button: UIButton, color: UIColor) {
    // Draw the border around a button.
    button.layer.masksToBounds = false
    button.layer.borderColor = color.cgColor
    button.layer.borderWidth = 2
    button.layer.cornerRadius = 6
    button.backgroundColor = color
}
