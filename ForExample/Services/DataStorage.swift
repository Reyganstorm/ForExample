//
//  DataStorage.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import Foundation

class DataStorage {
    static let shared = DataStorage()
    private init() {}
    
    let mainUser = User(name: "carol",
                        image: "Carol Black",
                        currenBalance: "20,600",
                        contacts:
    [Contact(image: "mike", name: "Mike"),
     Contact(image: "joshpeh", name: "Joshpeh"),
     Contact(image: "ashley", name: "Ashley")
                                  ]
    )
    
    
}
