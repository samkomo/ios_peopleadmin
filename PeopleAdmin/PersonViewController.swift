//
//  PersonViewController.swift
//  PeopleAdmin
//
//  Created by Santiago Hurtado on 8/7/14.
//  Copyright (c) 2014 Advance Teknologies. All rights reserved.
//

import Foundation

class PersonViewController:UIViewController{
    
    @IBOutlet weak var tId: UILabel!
    @IBOutlet weak var tName: UITextField!
    @IBOutlet weak var tLastname: UITextField!
    @IBOutlet weak var tCity: UITextField!
    @IBOutlet weak var tCountry: UITextField!
    
    var person:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var id = person["ID"] as NSInteger
        tId.text = String(id)
        tName.text = person["NAME"] as NSString
        tLastname.text=person["LASTNAME"] as NSString
        tCity.text=person["CITY"] as NSString
        tCountry.text=person["COUNTRY"] as NSString
        
        
    }
    
    override func didReceiveMemoryWarning() {
    }
}
