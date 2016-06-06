//
//  CustomUIPickerView.swift
//  Chemowave
//
//  Created by zaktech on 6/2/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit
protocol customPickerViewDelegate {
    func doneButtonTapped()
    func selectedStage(stage : NSString)
}

class CustomUIPickerView: UIView , UIPickerViewDataSource, UIPickerViewDelegate{
    var stagesArray = ["Stage 1","Stage 2","Stage 3","Stage 4"]
    var customDelegate: customPickerViewDelegate?
    let customPicker : UIPickerView = UIPickerView()
    
       required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
       
    }
    
    // for this to work programmatically I had to do the same...
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Drawing code
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let toolBar : UIToolbar = UIToolbar()
        toolBar.frame = CGRectMake(0, 0, screenWidth, 44)
        toolBar.barStyle = .Default
        let flex = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let barButtonDone = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(doneClicked))
        barButtonDone.tintColor = UIColor.blackColor()
        toolBar.items = [flex, barButtonDone]
        customPicker.frame = CGRectMake(0, toolBar.frame.size.height, screenWidth, 200)
        customPicker.delegate = self;
        customPicker.dataSource = self;
        customPicker.showsSelectionIndicator = true;
        customPicker.backgroundColor = UIColor.whiteColor()
        customPicker.layer.cornerRadius = 5.0
        customPicker.layer.shadowOpacity = 0.5
        self.frame = CGRectMake(0, 0, screenWidth, toolBar.frame.size.height + customPicker.frame.size.height)
        self.backgroundColor = UIColor.clearColor();
        self.addSubview(customPicker)
        self.addSubview(toolBar)

        }

    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stagesArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stagesArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        customDelegate?.selectedStage("\(stagesArray[row])")
    }
    
    func doneClicked()  {
        customDelegate?.doneButtonTapped()
    }

}
