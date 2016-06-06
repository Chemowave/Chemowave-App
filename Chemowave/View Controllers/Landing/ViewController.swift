//
//  ViewController.swift
//  Chemowave
//
//  Created by zaktech on 30/05/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}