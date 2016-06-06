//
//  CustomImageView.swift
//  Chemowave
//
//  Created by zaktech on 02/06/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.masksToBounds = true
    }
}
