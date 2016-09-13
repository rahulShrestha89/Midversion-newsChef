//
//  Images.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/12/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    enum Asset: String {
        case test = "test_image"

        
        var image: UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}
