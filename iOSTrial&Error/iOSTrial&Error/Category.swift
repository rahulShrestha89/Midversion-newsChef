//
//  Category.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/18/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

// Contains the model for category selection for users

import UIKit

class Category{

    var title: String
    var image: UIImage
    var section: String
    
    init(title: String, image: UIImage, section: String) {
        self.title = title
        self.image = image
        self.section = section
    }
    
    convenience init(copies category: Category)
    {
        self.init(title: category.title, image: category.image, section: category.section)
    }
}
