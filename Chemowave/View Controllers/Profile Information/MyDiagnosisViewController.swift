//
//  MyDiagnosisViewController.swift
//  Chemowave
//
//  Created by zaktech on 6/1/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

enum NSDateFormatterStyle : UInt {
    case NoStyle
    case ShortStyle
    case MediumStyle
    case LongStyle
    case FullStyle
}

class MyDiagnosisViewController: UIViewController, customPickerViewDelegate {

    @IBOutlet weak var pagerImageView: UIImageView!
    @IBOutlet weak var cancerTypeTxtF: CustomTextField!
    @IBOutlet weak var stagesTxtF: CustomTextField!
    @IBOutlet weak var dateTxtF: CustomTextField!
    
    @IBOutlet weak var newDiagnosBtn: UIButton!
    @IBOutlet weak var repeatDiagnosBtn: UIButton!
    var pickerOfStages: CustomUIPickerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.title = "My Diagnosis"
        let nextBtn = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: #selector(moveToProiflePicture))
        self.navigationItem.rightBarButtonItem = nextBtn
        self.navigationItem.rightBarButtonItem?.enabled = true
        customizeBtn()
        createDatePicker()
        addStagesPicker()
        pickerOfStages.customDelegate = self
        // Do any additional setup after loading the view.
    }

    
    func moveToProiflePicture()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewControllerWithIdentifier("Profile_Picture")
        self.navigationController?.pushViewController(myVC, animated: true)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - touchesBegan
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - newDiagnoses
    @IBAction func newDiagnoses(sender: UIButton) {
        if sender.selected {
            sender.backgroundColor = UIColor.clearColor()
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            sender.selected = false
        }
        else{
            sender.backgroundColor = UIColor.blackColor()
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.selected = true
            self.repeatDiagnosBtn.backgroundColor = UIColor.clearColor()
            self.repeatDiagnosBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            self.repeatDiagnosBtn.selected = false
        }
    }
    
    // MARK: - repeatDiagnoses
    @IBAction func repeatDiagnoses(sender: UIButton) {
        if sender.selected {
            sender.backgroundColor = UIColor.clearColor()
            sender.titleLabel?.textColor = UIColor.lightGrayColor()
            sender.selected = false
        }
        else{
            sender.backgroundColor = UIColor.blackColor()
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.selected = true
            self.newDiagnosBtn.backgroundColor = UIColor.clearColor()
            self.newDiagnosBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            self.newDiagnosBtn.selected = false
        }
    }

    // MARK: - customizeBtn
    func customizeBtn(){
        self.newDiagnosBtn.layer.cornerRadius = 5 // this value vary as per your desire
        self.newDiagnosBtn.clipsToBounds = true
        self.newDiagnosBtn.layer.borderColor=UIColor.lightGrayColor().CGColor;
        self.newDiagnosBtn.layer.borderWidth=1.0
        
        self.repeatDiagnosBtn.layer.cornerRadius = 5 // this value vary as per your desire
        self.repeatDiagnosBtn.clipsToBounds = true
        self.repeatDiagnosBtn.layer.borderColor=UIColor.lightGrayColor().CGColor;
        self.repeatDiagnosBtn.layer.borderWidth=1.0
    }

    // MARK: create PickerView
    func createDatePicker(){
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let toolBar : UIToolbar = UIToolbar()
        toolBar.frame = CGRectMake(0, 0, screenWidth, 44)
        toolBar.barStyle = .Default
        let flex = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let barButtonDone = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(doneClicked))
        barButtonDone.tintColor = UIColor.blackColor()
        toolBar.items = [flex, barButtonDone]
        let myDatePicker : UIDatePicker = UIDatePicker()
        myDatePicker.frame = CGRectMake(0, toolBar.frame.size.height, screenWidth, 200)
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.backgroundColor = UIColor.whiteColor()
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.shadowOpacity = 0.5
        myDatePicker.datePickerMode = .Date
        // add an event called when value is changed.
        myDatePicker.addTarget(self, action: #selector(MyDiagnosisViewController.onDidChangeDate(_:)), forControlEvents: .ValueChanged)
        
        // add DataPicker to the view
        self.view.addSubview(myDatePicker)
        let inputView : UIView = UIView ()
        inputView.frame = CGRectMake(0, 0, screenWidth, toolBar.frame.size.height + myDatePicker.frame.size.height)
        inputView.backgroundColor = UIColor.clearColor();
        inputView.addSubview(myDatePicker)
        inputView.addSubview(toolBar)
        self.dateTxtF.inputView = inputView;
    }
    
    // MARK: doneClicked
    func doneClicked()  {
        self.dateTxtF.resignFirstResponder()
    }
    
    @IBAction func onDidChangeDateByOnStoryboard(sender: UIDatePicker) {
        self.onDidChangeDate(sender)
    }
    
    // called when the date picker called.
    internal func onDidChangeDate(sender: UIDatePicker){
        let date = sender.date
        let formattedDate = NSDateFormatter.localizedStringFromDate(
            date,
            dateStyle: .LongStyle,
            timeStyle: .NoStyle)
            self.dateTxtF.text = formattedDate as String
    }
    
    // MARK: Custom PickerView
    func addStagesPicker()  {
        pickerOfStages = CustomUIPickerView()
        self.stagesTxtF.inputView = pickerOfStages
    }
    
   

    // MARK: doneButtonTapped
    func doneButtonTapped(){
      self.stagesTxtF.resignFirstResponder()
    }

    // MARK: selectedStage
    func selectedStage(stage : NSString){
      self.stagesTxtF.text = stage as String
    }

    
}
