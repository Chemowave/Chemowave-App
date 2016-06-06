//
//  ActionSheetView.swift
//  Chemowave
//
//  Created by zaktech on 6/5/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit
protocol actionSheetViewDelegate {
    func takeAPhoto()
    func chooseFromCameraRoll()
}

class ActionSheetView: UIView {

        var customActionSheetDelegate: actionSheetViewDelegate?
        
        
        @IBAction func cameraButtonPressed(sender: AnyObject) {
            customActionSheetDelegate?.takeAPhoto()
        }
        
        
        @IBAction func cameraRollButtonPressed(sender: AnyObject) {
            customActionSheetDelegate?.chooseFromCameraRoll()
            
        }
    

}
