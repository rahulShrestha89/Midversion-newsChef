//
//  SearchNewsViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/22/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import TwitterKit

class SearchNewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getTrendingTopicsFromTwitter()

    }

    private func getTrendingTopicsFromTwitter(){
    
        let url =  "\(APIConstants.Twitter.APIBaseURL)1.1/trends/place.json?id=1"
        
        let client = TWTRAPIClient()
        let statusesShowEndpoint = url
        let params = ["id": "1"]
        var clientError : NSError?
        
        let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray

                let jsonResult = json[0] as! NSDictionary
                
                let value = jsonResult["trends"] as! NSArray
                let value1 = value[0]
                
                print(value1)

                
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
            
            
        }
        
        
        
    }

}
