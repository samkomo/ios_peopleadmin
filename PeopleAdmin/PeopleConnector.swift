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
    
    init()
    {
        
    }
    func list(){
        let urlPath = "http://at3node.mybluemix.net"
        let url: NSURL = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url)
            {
                (data,response,error)in
                if(error){
                    println(error.localizedDescription)
                }
                else
                {
                    var result: NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
                    self.delegate?.didReceiveAPIResults(result)
                    println("Data was read")
                }
        }
        task.resume()
    }
}
