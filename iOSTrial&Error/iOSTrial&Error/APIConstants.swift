//
//  APIConstants.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/26/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit

// MARK: - Constants

struct APIConstants {
    
    // MARK: Twitter
    struct Twitter {
        static let APIBaseURL = "https://api.twitter.com/"
        static let APIScheme = "https"
        static let APIHost = "api.twitter.com"
        static let APIPath = "/services/rest"

    }
    
    // MARK: Twitter Parameter Keys
    struct TwitterParameterKeys {
        static let Method = "method"
        static let APIKey = "api_key"
        static let GalleryID = "gallery_id"
        static let Extras = "extras"
        static let Format = "format"
        static let NoJSONCallback = "nojsoncallback"
        static let SafeSearch = "safe_search"
        static let Text = "text"
        static let BoundingBox = "bbox"
        static let Page = "page"
    }
    

    

    
    
}

