//
//  LoginViewController.swift
//  Chemowave
//
//  Created by zaktech on 5/30/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var topLabel: CustomUILabel!
    @IBOutlet weak var emailTxtF: CustomTextField!
    @IBOutlet weak var passwordTxtF: CustomTextField!
    
    var loginButton: UIBarButtonItem = UIBarButtonItem()
   
    var checkEmailValidation = false
    var checkPasswordValidation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        
        self.title = "Log In"
//        loginButton = UIBarButtonItem(title: "LOG IN", style: .Plain, target: self, action: #selector(loginButtonTapped))
//       self.navigationItem.rightBarButtonItem = loginButton
//       self.navigationItem.rightBarButtonItem?.enabled = false
    }

    
    func loginButtonTapped() {
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let myVC = storyboard.instantiateViewControllerWithIdentifier("TabbarStoryboard")
        self.presentViewController(myVC, animated: true, completion: nil)
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
        if currentTextField == self.emailTxtF {
           self.passwordTxtF.becomeFirstResponder();
           }
         else{
            currentTextField.resignFirstResponder()
          }
        return true;
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
      textField.resignFirstResponder()
       validateEmail(textField)
    }
    
    func validateEmail(txtField : UITextField) {
        let currentTextField = txtField as! CustomTextField
        let fieldTag = currentTextField.tag
        if currentTextField == self.emailTxtF {
            self.checkEmailValidation = Validator_Manger.sharedInstance.validateEmail(txtField.text!)
            checkFieldStatus(fieldTag, status: self.checkEmailValidation)

        }
        else if currentTextField == self.passwordTxtF{
            self.checkPasswordValidation = Validator_Manger.sharedInstance.validatePassword(txtField.text!)
            checkFieldStatus(fieldTag, status: self.checkEmailValidation)
        }
        
        if self.checkEmailValidation && self.checkPasswordValidation{
            self.navigationItem.rightBarButtonItem?.enabled = true
        }
        else{
         self.navigationItem.rightBarButtonItem?.enabled = true
         topLabel.hidden = false
         topLabel.text = "Incorrect Email or Password"

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
