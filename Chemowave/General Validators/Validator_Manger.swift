//
//  Validator_Manger.swift
//  Chemowave
//
//  Created by zaktech on 5/30/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class Validator_Manger: NSObject {
    
    class var sharedInstance: Validator_Manger {
       let _sharedInstance = Validator_Manger()
        return _sharedInstance
    }
    
    func validateEmail(email : NSString) -> Bool {
        let emailRegix = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let resultPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegix)
        return resultPredicate.evaluateWithObject(email)
    }
    
    func validatePassword(password : NSString) -> Bool {
        let passwordRegix = "^(?=.*[a-z])(?=.*)(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let resultPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegix)
        return resultPredicate.evaluateWithObject(password)
    }
    
    func validateName(name : NSString) -> Bool {
        let nameRegix = "[a-zA-Z._%+-]+"
        let resultPredicate = NSPredicate(format: "SELF MATCHES %@", nameRegix)
        return resultPredicate.evaluateWithObject(name)
    }
    
    func validatePinCode(pinCode : NSString) -> Bool {
        let pinCodeRegix = "[0-9]{4,4}"
        let resultPredicate = NSPredicate(format: "SELF MATCHES %@", pinCodeRegix)
        return resultPredicate.evaluateWithObject(pinCode)
    }
    
    func validateAge(age : NSString) -> Bool {
        let ageRegix = "[0-9]+"
        let resultPredicate = NSPredicate(format: "SELF MATCHES %@", ageRegix)
        return resultPredicate.evaluateWithObject(age)
    }
    
    func validateZipCode(zipCode : NSString) -> Bool {
        let zipCodeRegix = "[0-9]{5,5}"
        let resultPredicate = NSPredicate(format: "SELF MATCHES %@", zipCodeRegix)
        return resultPredicate.evaluateWithObject(zipCode)
    }
    
    
    
}
