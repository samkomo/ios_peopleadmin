//
//  ViewController.swift
//  PeopleAdmin
//
//  Created by Santiago Hurtado on 8/5/14.
//  Copyright (c) 2014 Advance Teknologies. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,PeopleConnectorProtocol {

    @IBOutlet var appsTableView:UITableView?
    let kCellIdentifier: String = "SearchResultCell"
    var tableData = []
    var api = PeopleConnector()
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        self.api.delegate = self
        api.list()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        var person :NSDictionary = tableData[indexPath.row]as NSDictionary

        var name = person["NAME"] as NSString
        var lastname = person["LASTNAME"] as NSString
        var city = person["CITY"] as NSString
        var country = person["COUNTRY"] as NSString
        
        cell.textLabel.text = "\(name) \(lastname)"
        cell.detailTextLabel.text = "\(country), \(city)"
        
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("You selected cell #\(indexPath.row)!")
        /*
        var person :NSDictionary = tableData[indexPath.row]as NSDictionary
        var lastname = person["LASTNAME"] as NSString
        var country = person["COUNTRY"] as NSString
        var alert:UIAlertView = UIAlertView()*/
    }
    func didReceiveAPIResults(results: NSArray) {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = results
            self.appsTableView!.reloadData()
        })
    }
}

