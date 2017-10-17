# NAMDatabaseHelper
A FMDB helper  in Swift


## How to use

````swift
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
````
