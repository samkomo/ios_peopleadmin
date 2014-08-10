//
//  PeopleConnector.swift
//  PeopleAdmin
//
//  Created by Santiago Hurtado on 8/6/14.
//  Copyright (c) 2014 Advance Teknologies. All rights reserved.
//

import Foundation


protocol PeopleConnectorProtocol{
    func didReceiveList(results:NSArray)
}

class PeopleConnector{
    
    var delegate:PeopleConnectorProtocol?
    let manager:AFHTTPRequestOperationManager
    
    init()
    {
        var url:NSURL = NSURL(string:"http://at3node.mybluemix.net")
        manager = AFHTTPRequestOperationManager(baseURL:url)
    }
    func list(){
        manager.GET("",
            parameters:nil,
            success:{(operation:AFHTTPRequestOperation!,responseObject:AnyObject!)in
                if responseObject.isKindOfClass(NSArray)
                {
                    self.delegate?.didReceiveList(responseObject as NSArray)
                }
            },
            failure:{(operation:AFHTTPRequestOperation!,error:NSError!)in
                println("Error:"+error.localizedDescription)
        })
    }
}
