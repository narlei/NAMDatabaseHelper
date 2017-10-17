//
//  ViewController.swift
//  NAMOrm
//
//  Created by Narlei A Moreira on 17/10/17.
//  Copyright © 2017 Narlei A Moreira. All rights reserved.
//

import UIKit
import FMDB


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NAMDatabase
            .getTable("SETTINGS")
            .execute(query: "1 == 1") { (result) in
                switch (result) {
                case .success(let response):
                    print(response.toArray())
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

