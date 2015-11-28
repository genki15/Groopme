//
//  ViewController.swift
//  Groopme
//
//  Created by jerome de chillaz on 28/11/2015.
//  Copyright © 2015 jerome de chillaz. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    @IBAction func login(sender: UIButton) {
        
        
        
    }
    
    
    @IBAction func signUp(sender: UIButton) {
    
        if(usernameText != nil && passwordText != nil) {
            
            Parse.setApplicationId("k2Eo86ckAVwTH4aSsweB9whMpAPJatV5BS3agUIA", clientKey: "GVftBu7XNCEvOlaAceEdjnozbekQCARDR9gbUiSN")
            
            let user = PFUser()
            user.username = usernameText.text
            user.password = passwordText.text
            
            user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                
                if (success) {
                    print("Sign up complete")
                } else {
                    print("Sign up failed")
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

