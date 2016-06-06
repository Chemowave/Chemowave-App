//
//  ForgetPasswordViewController.swift
//  Chemowave
//
//  Created by zaktech on 5/30/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTxtF: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "Forgot Password"
      self.navigationController?.navigationBarHidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let currentTextField = textField as! CustomTextField
        currentTextField.resignFirstResponder();
        return true;
    }

    func textFieldDidEndEditing(textField: UITextField) {
        let currentTextField = textField as! CustomTextField
        validateFields(currentTextField)
    }
    
    func validateFields(field : CustomTextField)  {
        let fieldTag = field.tag
        let fieldTxt = field.text
        let emailValid = Validator_Manger.sharedInstance.validateEmail(fieldTxt!)
        checkFieldStatus(fieldTag, status: emailValid)
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
