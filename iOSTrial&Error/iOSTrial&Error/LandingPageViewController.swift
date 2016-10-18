//
//  LandingPageViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/11/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import DigitsKit
import Crashlytics
import FirebaseDatabase


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
        
        let ref = FIRDatabase.database().reference(withPath: "signedup-users")

        // Create a Digits appearance with Cannonball colors.
        let configuration = DGTAuthenticationConfiguration(accountFields: .defaultOptionMask)
        
        configuration?.appearance = DGTAppearance()
        configuration?.appearance.backgroundColor = UIColor.newsChefWhiteColor()
        configuration?.appearance.accentColor = UIColor.newsChefMainColor()
        
        Digits.sharedInstance().authenticate(with: nil, configuration:configuration!) { (session, error) in
            if session != nil {
                
                // this is temp: requires changes after python server setup
                // Navigate to the sign in vew
                
                self.navigationController?.popViewController(animated: true)
                
                self.dismiss(animated: true, completion: nil)
                
                Crashlytics.sharedInstance().setUserIdentifier(session!.userID)
                
                // check if this number is already regsitered on the FIREBASE database
                let userNumber = session?.phoneNumber

                ref.observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    if snapshot.hasChild(userNumber!){
                        
                        print("user already exists")
                        self.performSegue(withIdentifier: "showTabFromLanding", sender: self)
                        
                    }else{
                        
                        print("the user doesnt exist")
                        
                        let currentSession = session?.userID
                        let sessionToken = session?.authToken
                        
                        let userInfoModelData = PhoneNumber_FireBase(phoneNumber: userNumber!,
                                                                     userSession: currentSession!,
                                                                     sessionToken: sessionToken!)
                        
                        // send it to firebase
                        let userInfo = ref.child(userNumber!)
                        userInfo.setValue(userInfoModelData.toAnyObject())
                        
                        self.performSegue(withIdentifier: "showSignIn", sender: self)
                    }
                    
                    
                })
                
                

            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
            
        }
        
        
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
