//
//  Contacts.swift
//  Chemowave
//
//  Created by zaktech on 02/06/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import Foundation

class Contacts {
    
    let name : String
    let address: String
    let email: String
    var phoneNumbers:[String: String]? // Main: 03455151739, Home: 03319266221 etc
    var notes: [String: String]? // Note1: Notes data here, Note2: Notes data here.
    
    // designated
     init(name: String, address: String, email: String) {
        self.name = name
        self.address = address
        self.email = address
    }
}