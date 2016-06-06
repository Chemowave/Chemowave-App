//
//  Profile_Information_ViewController.swift
//  Chemowave
//
//  Created by zaktech on 5/31/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class Profile_Information_ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var pageViewerImageView: UIImageView!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var ageTxtF: CustomTextField!
    @IBOutlet weak var heightTxtF: CustomTextField!
    @IBOutlet weak var weightTxtF: CustomTextField!
    @IBOutlet weak var zipCodeTxtF: CustomTextField!
    @IBOutlet weak var notiSwitch: UISwitch!
    @IBOutlet weak var customSegmentView: UIView!

    var ageValid = false
    var heightValid = false
    var weightValid = false
    var zipCodeValid = false
    var selectedGender = ""
    var notificationStatus = true

    var feetArray = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var inchArray = ["00","01","02","03","04","05","06","07","08","09","010","011"]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.title = "About Me"
        let nextBtn = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: #selector(moveNext))
        self.navigationItem.rightBarButtonItem = nextBtn
        self.navigationItem.rightBarButtonItem?.enabled = true
        customizeBtn()
        createPicker()
        // Do any additional setup after loading the view.
    }

    // MARK: - notifcation
    @IBAction func notifcation(sender: UISwitch) {
        if sender.on {
            self.notificationStatus = true
        }
        else{
            self.notificationStatus = false
        }
    }
    
    // MARK: - moveNext
    func moveNext(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewControllerWithIdentifier("MyDiagnosisView")
        self.navigationController?.pushViewController(myVC, animated: true)
   
    }
    
    // MARK: - selectMale
    @IBAction func selectMale(sender: UIButton) {
        if sender.selected {
            sender.backgroundColor = UIColor.clearColor()
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            sender.selected = false
            self.selectedGender = ""
        }
        else{
            sender.backgroundColor = UIColor.blackColor()
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.selected = true
            self.femaleBtn.backgroundColor = UIColor.clearColor()
            self.femaleBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            self.femaleBtn.selected = false
            self.selectedGender = (sender.titleLabel?.text)!
        }
    }
    
    // MARK: - selectFemale
    @IBAction func selectFemale(sender: UIButton) {
        if sender.selected {
            sender.backgroundColor = UIColor.clearColor()
            sender.titleLabel?.textColor = UIColor.lightGrayColor()
            sender.selected = false
            self.selectedGender = ""
        }
        else{
            sender.backgroundColor = UIColor.blackColor()
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.selected = true
            self.maleBtn.backgroundColor = UIColor.clearColor()
            self.maleBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            self.maleBtn.selected = false
            self.selectedGender = (sender.titleLabel?.text)!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - textFieldShouldReturn
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let currentTextField = textField as! CustomTextField
        
        if currentTextField == self.ageTxtF {
            self.heightTxtF.becomeFirstResponder()
        }
        else if currentTextField == self.heightTxtF {
            self.weightTxtF.becomeFirstResponder()
        }
        else if currentTextField == self.weightTxtF {
            self.zipCodeTxtF.becomeFirstResponder()
        }
        else{
            currentTextField .resignFirstResponder()
        }
        return true
    }

    // MARK: - textFieldDidEndEditing
    func textFieldDidEndEditing(textField: UITextField) {
        let currentTextField = textField as! CustomTextField
        validateFields(currentTextField)
    }
    
    // MARK: - validateFields
    func validateFields(field : CustomTextField)  {
        let fieldTag = field.tag
        let fieldTxt = field.text
        
        if fieldTag == 1001 {
            self.ageValid = Validator_Manger.sharedInstance.validateAge(fieldTxt!)
            checkFieldStatus(fieldTag, status: self.ageValid)
            if self.ageValid {
            }
            else{
            }
        }
        else if fieldTag == 1002 {
            
        }
        else if fieldTag == 1003 {
            self.weightValid = Validator_Manger.sharedInstance.validateAge(fieldTxt!)
            checkFieldStatus(fieldTag, status: self.weightValid)
            if self.self.weightValid {
              
            }
            else{
            }
        }
        else{
            self.zipCodeValid = Validator_Manger.sharedInstance.validateZipCode(fieldTxt!)
            checkFieldStatus(fieldTag, status: self.zipCodeValid)
            if self.zipCodeValid {
            }
            else{
            }
        }
        
        if self.ageValid && self.weightValid && self.zipCodeValid && !(self.heightTxtF.text?.isEmpty)! {
            self.navigationItem.rightBarButtonItem?.enabled = true
        }
    }
    
    // MARK: - checkFieldStatus
    func checkFieldStatus(txtFTag : Int, status : Bool)  {
        if status {
            if let theFeild = self.view.viewWithTag(txtFTag) as? UITextField {
                theFeild.layer.borderColor=UIColor.lightGrayColor().CGColor;
            }
        }
        else{
            if let theFeild = self.view.viewWithTag(txtFTag) as? UITextField {
                theFeild.layer.borderColor=UIColor.redColor().CGColor;
            }
        }
    }

    // MARK: - touchesBegan
     override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - customizeBtn
    func customizeBtn(){
        self.maleBtn.layer.cornerRadius = 5 // this value vary as per your desire
        self.maleBtn.clipsToBounds = true
        self.maleBtn.layer.borderColor=UIColor.lightGrayColor().CGColor;
        self.maleBtn.layer.borderWidth=1.0
        
        self.femaleBtn.layer.cornerRadius = 5 // this value vary as per your desire
        self.femaleBtn.clipsToBounds = true
        self.femaleBtn.layer.borderColor=UIColor.lightGrayColor().CGColor;
        self.femaleBtn.layer.borderWidth=1.0
    }
    
    // MARK: create PickerView
    func createPicker(){
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let toolBar : UIToolbar = UIToolbar()
        toolBar.frame = CGRectMake(0, 0, screenWidth, 44)
        toolBar.barStyle = .Default
        let flex = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let barButtonDone = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(doneClicked))
        barButtonDone.tintColor = UIColor.blackColor()
        toolBar.items = [flex, barButtonDone]
        let picker : UIPickerView = UIPickerView()
        picker.frame = CGRectMake(0, toolBar.frame.size.height, screenWidth, 200)
        picker.delegate = self;
        picker.dataSource = self;
        picker.showsSelectionIndicator = true;
        picker.backgroundColor = UIColor.whiteColor()
        picker.layer.cornerRadius = 5.0
        picker.layer.shadowOpacity = 0.5

        let firstComponentHeader = "Feet"
        let lblWidth = picker.frame.size.width/CGFloat(picker.numberOfComponents);
        let lblYposition = (picker.frame.origin.y);
        let lblXposition = picker.frame.origin.x;
        let feetLbl : UILabel = UILabel ()
        feetLbl.frame = CGRectMake(lblXposition,lblYposition,lblWidth,20)
        feetLbl.text = firstComponentHeader
        feetLbl.textAlignment = .Center
        
        let secondComponentHeader = "Inches"
        let lbl1Width = picker.frame.size.width/CGFloat(picker.numberOfComponents);
        let lbl1Yposition = (picker.frame.origin.y);
        let lbl1Xposition = picker.frame.origin.x;
        let inchesHeaderLbl : UILabel = UILabel ()
        if picker.numberOfComponents == 2 {
        inchesHeaderLbl.frame = CGRectMake((lbl1Xposition + lbl1Width),lbl1Yposition,lbl1Width,20)
        }
        inchesHeaderLbl.text = secondComponentHeader
        inchesHeaderLbl.textAlignment = .Center
        
        let inputView : UIView = UIView ()
        inputView.frame = CGRectMake(0, 0, screenWidth, toolBar.frame.size.height + picker.frame.size.height)
        inputView.backgroundColor = UIColor.clearColor();
        inputView.addSubview(picker)
        inputView.addSubview(toolBar)
        inputView.addSubview(feetLbl)
        inputView.addSubview(inchesHeaderLbl)
        self.heightTxtF.inputView = inputView;

    }
    
    // MARK: doneClicked
    func doneClicked()  {
      self.weightTxtF.becomeFirstResponder()
    }
    
    // MARK: pickerView Delegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rowsInComponent = 0
        if component == 0 {
            rowsInComponent = self.feetArray.count
        }
        else{
            rowsInComponent = self.inchArray.count
        }
           return rowsInComponent
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var nameInRow = ""
        if component == 0 {
            nameInRow = self.feetArray[row]
        }
        else{
            nameInRow = self.inchArray[row]
        }
        return nameInRow
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       self.heightTxtF.text =  String (format: "\(self.feetArray[row])' " + "\(self.inchArray[row])\"")
    }
    
//    // MARK: customizeSegment
//    func customizeSegment()  {
//        self.customSegmentView.layer.cornerRadius = 5 // this value vary as per your desire
//        self.customSegmentView.clipsToBounds = true
//        self.customSegmentView.layer.borderColor=UIColor.clearColor().CGColor;
//        self.customSegmentView.layer.borderWidth=1.5
//    }

    
}
