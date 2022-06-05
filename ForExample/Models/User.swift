//
//  User.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import Foundation

struct User {
    let name: String
    let image: String
    let currenBalance: String
    
    let contacts: [Contact]
}

struct Contact {
    let image: String
    let name: String
}
