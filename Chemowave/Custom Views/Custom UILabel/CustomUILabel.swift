//
//  CustomUILabel.swift
//  Chemowave
//
//  Created by zaktech on 5/31/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class CustomUILabel: UILabel {

//    @IBInspectable var newproperty : Int!
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        commonInit()

    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    func commonInit(){
        self.clipsToBounds = true
        self.textColor = UIColor.redColor()
        self.setProperties(1.0, borderColor:UIColor.lightGrayColor())
    }
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.CGColor
    }

   }
