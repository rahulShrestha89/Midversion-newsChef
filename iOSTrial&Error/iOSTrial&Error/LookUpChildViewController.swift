//
//  LookUpChildViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/13/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit

class LookUpChildViewController: UIViewController {
    @IBAction func onSkipButtonTapped(_ sender: AnyObject) {
    
    
    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var mainTextView: UILabel!
    var pageIndex: Int = 0
    var strTitle : String!
    var strPhotoName : String!
    var strMainTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: strPhotoName)
        self.textView.text = self.strTitle
        self.textView.alpha = 0.7
        
        self.mainTextView.text = self.strMainTitle
        
        self.textView.font = UIFont(name: "Avenir-Light", size: 19.0)

    }
}
