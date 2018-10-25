//
//  UserBoxSdk.swift
//  UserBoxSDK
//
//  Created by Furkan Bekil on 2.10.2018.
//  Copyright © 2018 Furkan Bekil. All rights reserved. Test For V2
//

import UIKit

public class UserBoxSdk: NSObject {

    public static let shared = UserBoxSdk()
    
    private var isInit = false
    
    private var token = ""
    private var secret = ""
    
    private var people = UserBoxPeopleModel.init(id: UIDevice.current.identifierForVendor!.uuidString, device_type: "ios", device_version: UIDevice.current.systemVersion, device_token: UIDevice.current.identifierForVendor!.uuidString, device_push_token: "", name: "")
    
    
    
    open func initUserBoxWithToken(token: String, secret: String) {
        
        debugPrint("Attempted Init UserBox With Token & Secret")
        
        let url = URL.init(string: "https://mobworks.com.tr/public/test/userbox/public/api/v1/user/init")
        var request = URLRequest(url: url!)
        request.setValue(token, forHTTPHeaderField: "token")
        request.setValue(secret, forHTTPHeaderField: "secret")
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            
            if let jsonArray = json as? Dictionary<String, AnyObject> {
                
                if let errorCode = jsonArray["errorCode"] as? String {
                    
                    if errorCode == "00" {
                        
                        self.token = token
                        self.secret = secret
                        self.isInit = true
                        debugPrint("Userbox has been initiliazed")
                        
                        self.adjustCustomEvents()
                        
                    }
                    
                }
                
                
            }
            
        } catch let jsonErr {
            
            print("Error serializing json:* - inituserbox", jsonErr)
            
        }
        
        
        }.resume()
        
    }
    
    open func trackEvent(eventName: String) {
        
        debugPrint("Event Sending...")
        
        let url = URL.init(string: "https://mobworks.com.tr/public/test/userbox/public/api/v1/event/set")
        var request = URLRequest(url: url!)
        request.setValue("1b99628cab40b9fa0e5093b2e798365e88cdc8f155ab199e79176fde2983370f", forHTTPHeaderField: "token")
        request.setValue("70d3957af31228e61f7a49105ffbbdc8076a7798ff78ada8", forHTTPHeaderField: "secret")
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = ["value": eventName,
                                         "people_id": people.id
        ]
        
        let parameterData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = parameterData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                if let jsonArray = json as? Dictionary<String, AnyObject> {
                    
                    print(jsonArray)
                    
                    if let errorCode = jsonArray["errorCode"] as? String {
                        
                        if errorCode == "00" {
                            
                            debugPrint("Event Sent \(eventName)")
                            
                        }
                        
                    }
                    
                    
                }
                
            } catch let jsonErr {
                
                print("Error serializing json:* - trackEvent = \(eventName)", jsonErr)
                
            }
            
            
            }.resume()
        
    }
    
    open func setPeople(name: String, devicePushToken: String?, peopleID: String?) {
        
        self.people.name = name
        
        if devicePushToken != nil {
            self.people.device_push_token = devicePushToken!
        }
        
        if peopleID != nil {
            self.people.id = peopleID!
        }
        
        
        debugPrint("People Setting...")
        
        let url = URL.init(string: "https://mobworks.com.tr/public/test/userbox/public/api/v1/people/set")
        var request = URLRequest(url: url!)
        request.setValue("1b99628cab40b9fa0e5093b2e798365e88cdc8f155ab199e79176fde2983370f", forHTTPHeaderField: "token")
        request.setValue("70d3957af31228e61f7a49105ffbbdc8076a7798ff78ada8", forHTTPHeaderField: "secret")
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = ["device_type": people.device_type,
                                         "people_id": people.id,
                                         "device_version": people.device_version,
                                         "device_token": people.device_token,
                                         "device_push_token": people.device_push_token,
                                         "name": people.name
        ]
        
        let parameterData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = parameterData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                if let jsonArray = json as? Dictionary<String, AnyObject> {
                    
                    print(jsonArray)
                    
                    if let errorCode = jsonArray["errorCode"] as? String {
                        
                        if errorCode == "00" {
                            
                            debugPrint("people is set.")
                            
                            
                        }
                        
                    }
                    
                    
                }
                
            } catch let jsonErr {
                
                print("Error serializing json:* - setPeople", jsonErr)
                
            }
            
            
            }.resume()
        
    }
    
    open func trackEventWithProperty(eventName: String, Properties: [String: String]) {
        
        debugPrint("Event Sending...")
        
        let url = URL.init(string: "https://mobworks.com.tr/public/test/userbox/public/api/v1/event/set")
        var request = URLRequest(url: url!)
        request.setValue("1b99628cab40b9fa0e5093b2e798365e88cdc8f155ab199e79176fde2983370f", forHTTPHeaderField: "token")
        request.setValue("70d3957af31228e61f7a49105ffbbdc8076a7798ff78ada8", forHTTPHeaderField: "secret")
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = ["value": eventName,
                                         "property": Properties,
                                         "people_id": people.id
        ]
        
        let parameterData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = parameterData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                if let jsonArray = json as? Dictionary<String, AnyObject> {
                    
                    print(jsonArray)
                    
                    if let errorCode = jsonArray["errorCode"] as? String {
                        
                        if errorCode == "00" {
                            
                            debugPrint("Event Sent \(eventName) / \(Properties)")
                            
                        }
                        
                    }
                    
                    
                }
                
            } catch let jsonErr {
                
                print("Error serializing json:* trackevent with prperty \(eventName)", jsonErr)
                
            }
            
            
            }.resume()
        
        
    }
    
    // Custom Events
    
    private func adjustCustomEvents() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willBecomeActive), name: UIApplication.willEnterForegroundNotification, object: nil)
        
    }
    
    // Will Resign Active
    @objc private func willResignActive() {
        
        DispatchQueue.background(background: {
            // do something in background
            self.trackEvent(eventName: "App goes background")
        }, completion:{
            // when background job finished, do something in main thread
        })
        
    }
    
    @objc private func willBecomeActive() {
        
        
        DispatchQueue.background(background: {
            // do something in background
            self.trackEvent(eventName: "App comes from background")
        }, completion:{
            // when background job finished, do something in main thread
        })
        
    }
        
        
        
}

extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
    
}
