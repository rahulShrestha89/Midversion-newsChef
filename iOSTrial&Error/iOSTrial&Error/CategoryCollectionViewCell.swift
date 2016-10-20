//
//  CategoryCollectionViewCell.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/19/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    
    
    var category: Category?
        {
        didSet{
            updateUI()
        }
    }
    
    func updateUI()
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8.0
        categoryTitleLabel.text = category?.title
        categoryImageView.image = category?.image
    }
    
}
