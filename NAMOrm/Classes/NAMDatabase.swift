//
//  NAMDatabase.swift
//  NAMOrm
//
//  Created by Narlei A Moreira on 17/10/17.
//  Copyright © 2017 Narlei A Moreira. All rights reserved.
//

import Foundation
import FMDB

class NAMDatabase {
    
    class func getDatabasePath() -> String {
        return "database.sqlite"
    }
    
    
    
    class func getTable(_ table:String) -> NAMTable {
        return NAMTable(pName: table)
    }
}
