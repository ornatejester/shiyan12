//
//  ViewController.swift
//  iostest12
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 2016110433. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let result=db.open(dbPath: "", copyFile: true)
        print("result:\(result)")
        print(NSHomeDirectory())
        print(Bundle.main.bundlePath)
        let r=db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("r:\(r)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func add(_ sender: Any) {
        let r = db.execute(sql: "insert into person values('\(tfname.text!)','\(tfphone.text!)')")
        print("r:\(r)")
    }
    @IBAction func update(_ sender: Any) {
        let r = db.execute(sql: "update person set phone='\(tfphone.text!)' where name='\(tfname.text!)'")
        print("r:\(r)")
    }
    @IBAction func del(_ sender: Any) {
        let r = db.execute(sql: "delete from person where name='\(tfname.text!)'")
        print("r:\(r)")
    }
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(tfname.text!)'")
        if let person = persons.first,let phone = person["phone"] as? String {
            tfphone.text=phone
        }
    }
}

