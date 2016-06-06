//
//  CustomTextField.swift
//  Chemowave
//
//  Created by zaktech on 5/30/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    var imageView = UIImageView()
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let leftLabel = UILabel(frame: CGRectMake(10,0,7,26))
        leftLabel.backgroundColor = UIColor.clearColor()
        self.leftView = leftLabel
        self.leftViewMode = .Always
        self.contentVerticalAlignment = .Center
        self.layer.borderColor=UIColor.clearColor().CGColor;
        self.layer.borderWidth=1.0
        self.backgroundColor = UIColor.clearColor();
        self.layer.cornerRadius = 2
        
//        let frame = self.frame
//        imageView.frame = CGRectMake(frame.size.width - 50, 5.0, 20.0,20.0)
//        self.rightView = imageView
//        self.rightViewMode = .Always
//        self.contentHorizontalAlignment = .Center
//        self.contentVerticalAlignment = .Center

        let rightLabel = UILabel(frame: CGRectMake(frame.size.width - 50,0,50,20))
        rightLabel.backgroundColor = UIColor.clearColor()
        self.rightView = rightLabel
        self.rightViewMode = .Always
        self.contentVerticalAlignment = .Center
        
    
    }
}


