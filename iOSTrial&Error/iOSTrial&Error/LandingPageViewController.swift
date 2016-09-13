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
    
    @IBOutlet weak var signInButton: UIButton!
 
    @IBOutlet weak var lookAroundButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decorateButton(signInButton, color: UIColor.newsChefGreenColor())
        
        decorateButton(lookAroundButton, color: UIColor.newsChefBlueColor())
        
    }

    @IBAction func onLookAroundButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("showLookAround", sender: self)
    }
}


private func decorateButton(button: UIButton, color: UIColor) {
    // Draw the border around a button.
    button.layer.masksToBounds = false
    button.layer.borderColor = color.CGColor
    button.layer.borderWidth = 2
    button.layer.cornerRadius = 6
    button.backgroundColor = color
}
