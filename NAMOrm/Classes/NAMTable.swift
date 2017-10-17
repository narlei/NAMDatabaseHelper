//
//  NAMTable.swift
//  NAMOrm
//
//  Created by Narlei A Moreira on 17/10/17.
//  Copyright © 2017 Narlei A Moreira. All rights reserved.
//

import Foundation
import FMDB

enum Result<T> {
    case success(T)
    case failure(Error)
}


class NAMTable {
    
    // MARK: Properties
    var name:String = ""
    
    
    // MARK: Constructors
    
    init(pName:String) {
        name = pName
    }
    
    
    // MARK: Query Methods
    
    func execute(query:String, onComplete:(Result<FMResultSet>)-> Void) {
        
        let path = Bundle.main.path(forResource: "database", ofType: "sqlite")
        let db = FMDatabase(path: path)
        db.open()
        
        
        let allQuery = "SELECT * FROM \(self.name) WHERE \(query)"
        
        do {
            let result = try db.executeQuery(allQuery, values: nil)
            onComplete(.success(result))
        } catch let error {
            onComplete(.failure(error))
            return
        }        
    }
    
}


extension FMResultSet {
    func toArray() -> [Any] {
        let arrayReturn = NSMutableArray()
        while self.next() {
            if let dict = self.resultDictionary {
                arrayReturn.add(dict)
            }
        }
        return arrayReturn as! [Any]
    }
}
