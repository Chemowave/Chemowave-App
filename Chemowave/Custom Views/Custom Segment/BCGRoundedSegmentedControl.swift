//
//  BCGRoundedSegmentedControl.swift
//  TestProject
//
//  Created by ZaeemZafar on 3/2/16.
//  Copyright © 2016 ZaeemZafar. All rights reserved.
//

import UIKit

class BCGRoundedSegmentedControl: UISegmentedControl {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
//    @IBInspectable var font: CGFloat = 12 {
//        didSet {
//            
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        print(BCGConstants.Fonts.Size.SegmentedControlFontSize)
        self.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Cochin", size: 18.0)!], forState: UIControlState.Normal)
    }
    

    override func layoutSubviews() {
        self.setCustomLayout()

        super.layoutSubviews()
    }
    
    
    func setCustomLayout() {
        self.layer.cornerRadius = 2.0
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 1.0
        self.tintColor = UIColor(red: 253.0/255.0, green: 184.0/255.0, blue: 42.0/255.0, alpha: 1.0)
        self.layer.masksToBounds = true
        
        self.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.yellowColor()], forState: .Selected)
        
        for subview in self.subviews {
            subview.layer.cornerRadius = 2.0
            subview.layer.borderColor = UIColor.whiteColor().CGColor
            subview.layer.masksToBounds = true
        }
        
    }
}
