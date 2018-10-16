//
//  UserBoxPeopleModel.swift
//  UserBoxSDK
//
//  Created by Furkan Bekil on 2.10.2018.
//  Copyright © 2018 Furkan Bekil. All rights reserved.
//

import Foundation

class UserBoxPeopleModel {
    
    var id: String
    var device_type: String
    var device_version: String
    var device_token: String
    var device_push_token: String
    var name: String
    
    
    init(id: String, device_type: String, device_version: String, device_token: String, device_push_token: String, name: String) {
        
        self.id = id
        self.device_type = device_type
        self.device_version = device_version
        self.device_token = device_token
        self.device_push_token = device_push_token
        self.name = name
        
    }
    
    
}
