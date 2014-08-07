//
//  PeopleConnector.swift
//  PeopleAdmin
//
//  Created by Santiago Hurtado on 8/6/14.
//  Copyright (c) 2014 Advance Teknologies. All rights reserved.
//

import Foundation


protocol PeopleConnectorProtocol{
    func didReceiveAPIResults(results:NSArray)
}

class PeopleConnector{
    
    var delegate:PeopleConnectorProtocol?
    let manager = AFHTTPRequestOperationManager()
    
    init()
    {
        
    }
    func list(){
        manager.GET("http://at3node.mybluemix.net/",
            parameters:nil,
            success:{(operation:AFHTTPRequestOperation!,responseObject:AnyObject!)in
                if responseObject.isKindOfClass(NSArray)
                {
                    println("Array")
                    self.delegate?.didReceiveAPIResults(responseObject as NSArray)
                }
                println("JSON:"+responseObject.description)
            },
            failure:{(operation:AFHTTPRequestOperation!,error:NSError!)in
                println("Error:"+error.localizedDescription)
        })
    }
}
