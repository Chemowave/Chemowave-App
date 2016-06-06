//
//  RegistrationViewController.swift
//  Chemowave
//
//  Created by zaktech on 5/30/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var nameTxtF: CustomTextField!
    @IBOutlet weak var emailTxtF: CustomTextField!
    @IBOutlet weak var passwordTxtF: CustomTextField!
    @IBOutlet weak var pinCodeTxtF: CustomTextField!
    @IBOutlet weak var passSuggLbl: UILabel!
    @IBOutlet weak var nameFIcon: UIImageView!
    @IBOutlet weak var emailFIcon: UIImageView!
    @IBOutlet weak var passwordFIcon: UIImageView!
    @IBOutlet weak var pinCodeIcon: UIImageView!
    
    var nameValid = false
    var emailValid = false
    var passwordValid = false
    var pinCodeValid = false


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.title = "Sign Up"
        let signUpBtn = UIBarButtonItem(title: "CREATE", style: .Plain, target: self, action: #selector(signUPButtonTapped))
        self.navigationItem.rightBarButtonItem = signUpBtn
        self.navigationItem.rightBarButtonItem?.enabled = true
        // Do any additional setup after loading the view.
    }
    
    func signUPButtonTapped(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewControllerWithIdentifier("Profile_Information")
        self.navigationController?.pushViewController(myVC, animated: true)
    }
    
    @IBAction func showPassword(sender: UIButton) {
        if sender.selected {
            self.passwordTxtF.secureTextEntry = true
            sender.selected = false
        }
        else{
            self.passwordTxtF.secureTextEntry = false
            sender.selected = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        super.viewDidDisappear(animated)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let currentTextField = textField as! CustomTextField
        
        if currentTextField == self.nameTxtF {
            self.emailTxtF.becomeFirstResponder()
        }
        else if currentTextField == self.emailTxtF {
            self.passwordTxtF.becomeFirstResponder()
        }
        else if currentTextField == self.passwordTxtF {
            self.pinCodeTxtF.becomeFirstResponder()
        }
        else{
           currentTextField .resignFirstResponder()
        }
        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        let currentTextField = textField as! CustomTextField
        validateFields(currentTextField)
    }
    
    func validateFields(field : CustomTextField)  {
        let fieldTag = field.tag
        let fieldTxt = field.text
        
        if fieldTag == 101 {
         self.nameValid = Validator_Manger.sharedInstance.validateName(fieldTxt!)
            self.nameFIcon.hidden = false
            checkFieldStatus(fieldTag, status: self.nameValid)
            if self.nameValid {
                self.nameFIcon.image = UIImage(named: "validIcon")!
            }
            else{
                self.nameFIcon.image = UIImage(named: "invalidIcon")!
            }
        }
       else if fieldTag == 102 {
            self.emailValid = Validator_Manger.sharedInstance.validateEmail(fieldTxt!)
            self.emailFIcon.hidden = false
            checkFieldStatus(fieldTag, status: self.emailValid)
            if self.emailValid {
                self.emailFIcon.image = UIImage(named: "validIcon")!
               
            }
            else{
                self.emailFIcon.image = UIImage(named: "invalidIcon")!
            }
        }
       else if fieldTag == 103 {
            self.passwordValid = Validator_Manger.sharedInstance.validatePassword(fieldTxt!)
            self.passwordFIcon.hidden = false
            checkFieldStatus(fieldTag, status: self.passwordValid)
            if self.passwordValid {
                self.passwordFIcon.image = UIImage(named: "validIcon")!
                self.passSuggLbl.textColor = UIColor.lightGrayColor()
            }
            else{
                self.passwordFIcon.image = UIImage(named: "invalidIcon")!
                self.passSuggLbl.textColor = UIColor.redColor()
            }
        }
        else{
            self.pinCodeValid = Validator_Manger.sharedInstance.validatePinCode(fieldTxt!)
            self.pinCodeIcon.hidden = false
            checkFieldStatus(fieldTag, status: self.pinCodeValid)
            if self.pinCodeValid {
                self.pinCodeIcon.image = UIImage(named: "validIcon")!
            }
            else{
                self.pinCodeIcon.image = UIImage(named: "invalidIcon")!
            }
        }
        
        if self.nameValid && self.emailValid && self.passwordValid && self.pinCodeValid {
            self.navigationItem.rightBarButtonItem?.enabled = true
        }
    }
   
    
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
