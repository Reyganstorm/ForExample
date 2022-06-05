//
//  ViewModel.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var contacts: [Contact] { get }
    var currentBalance: String { get }
    
    //init(user: User)
}

class ViewModel: ViewModelProtocol {
    //let user: User
    
    var currentBalance: String {
        DataStorage.shared.mainUser.currenBalance
    }
    
    var contacts: [Contact] {
        DataStorage.shared.mainUser.contacts
    }
    
    
}
