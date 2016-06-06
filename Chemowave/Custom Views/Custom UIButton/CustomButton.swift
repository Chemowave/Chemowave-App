//
//  CustomButton.swift
//  Chemowave
//
//  Created by zaktech on 5/30/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = 5 // this value vary as per your desire
        self.clipsToBounds = true
        self.layer.borderColor=UIColor.clearColor().CGColor;
        self.layer.borderWidth=1.5
        // ahjelasdjkflasdjkflsdjkfasdjlfsadjkflsadhjif
        //asfsdafsadfsdfsdsdfa
        
    }
 

}
