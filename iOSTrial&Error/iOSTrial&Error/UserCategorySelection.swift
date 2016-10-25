//
//  UserCategorySelection.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/25/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import Foundation

struct UserCategorySelection {
    
    let phoneNumber: String
    let sessionToken: String
    let topics : String
    
    init(phoneNumber: String, sessionToken: String, topics: String) {
        self.phoneNumber = phoneNumber
        self.sessionToken = sessionToken
        self.topics = topics
        
    }
    
    func toAnyObject() -> Any {
        return [
            "phoneNumber": phoneNumber,
            "sessionToken": sessionToken,
            "topics": topics
        ]
    }
}
