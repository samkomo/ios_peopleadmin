//
//  ViewController.swift
//  PeopleAdmin
//
//  Created by Santiago Hurtado on 8/5/14.
//  Copyright (c) 2014 Advance Teknologies. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var appsTableView:UITableView?

    var tableData = []
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getPeople()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        var person :NSDictionary = tableData[indexPath.row]as NSDictionary
        var name = person["NAME"] as NSString
        var lastname = person["LASTNAME"] as NSString
        
        var city = person["CITY"] as NSString
        var country = person["COUNTRY"] as NSString
        
        cell.textLabel.text = "\(name) \(lastname)"
        cell.detailTextLabel.text = "\(country), \(city)"
        
        return cell
    }
    func getPeople(){
        println("Request data")
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
                    self.tableData = result
                    self.appsTableView!.reloadData()
                    println("Read Data")
                }
        }
        task.resume()
    }

}

