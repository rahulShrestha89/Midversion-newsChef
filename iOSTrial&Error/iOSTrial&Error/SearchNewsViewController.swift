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

    var TrendingTopicsList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTrendingTopicsFromTwitter()

    }

    private func getTrendingTopicsFromTwitter(){
    
        var list :[String] = []
        
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789# ")

        let hashTag: Character = "#"
        
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
                
                for item in value{
                   
                    let finalValue = item as! NSDictionary
                    
                    var trendingName = finalValue["name"]! as! String
                    
                    if trendingName.rangeOfCharacter(from: characterset.inverted) == nil {
                        
                        if trendingName.characters.contains(hashTag)
                        {
                            trendingName.remove(at: trendingName.startIndex)
                        }
                        
                        list.append(trendingName)
                    }
                }
   
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
            
            self.TrendingTopicsList = list
            
            print(self.TrendingTopicsList)
            
        }
     
    }

}
