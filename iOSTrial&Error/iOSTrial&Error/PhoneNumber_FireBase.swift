//
//  PhoneNumber_FireBase.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/17/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//


import Foundation

struct PhoneNumber_FireBase {
    
    let phoneNumber: String
    let userSession: String

    init(phoneNumber: String, userSession: String) {
        self.phoneNumber = phoneNumber
        self.userSession = userSession

    }
    
    func toAnyObject() -> Any {
        return [
            "phoneNumber": phoneNumber,
            "userSession": userSession
        ]
    }
}
