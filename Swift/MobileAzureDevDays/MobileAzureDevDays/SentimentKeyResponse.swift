//
//  SentimentKeyResponse.swift
//  MobileAzureDevDays
//
//  Created by Karl Piteira on 10/9/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import Foundation

class SentimentApiKeyDocument {
    let regionKey = "region"
    let keyKey = "key"
    
    var region:String!
    var key:String!
    
    init?(fromJson dict: [String:Any]) {
        if let region = dict[regionKey] as? String, let key = dict[keyKey] as? String {
            self.region = region
            self.key = key
        } else {
            return nil
        }
    }
}
