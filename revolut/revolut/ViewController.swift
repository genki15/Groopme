//
//  ViewController.swift
//  revolut
//
//  Created by jerome de chillaz on 12/12/2015.
//  Copyright © 2015 jerome de chillaz. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBAction func shareTwitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)
        {
            
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            self.presentViewController(tweetShare, animated: true, completion: nil)
            
        }
        else
        {
            
            let alert = UIAlertController(title: "Accounts", message: "Please login or install the app to tweet", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func shareFacebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)
        {
            let facebookShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            self.presentViewController(facebookShare, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Accounts", message: "Please login or install the app to share on Facebook", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://134.213.221.48/users/c86ec48b-6435-4418-a85d-bacf056b1768/transactions")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            if let test = data{
            let webContent = NSString(data: test, encoding: NSUTF8StringEncoding)
            
            //componentsSeparatedByCharactersInSet(NSCharacterSet (charactersInString: "\""))
            var temp = webContent!.componentsSeparatedByString("},{")
            temp[0].removeAtIndex(temp[0].startIndex)
            temp[0].removeAtIndex(temp[0].startIndex)
            temp[temp.count - 1].removeAtIndex(temp[temp.count - 1].endIndex.predecessor())
            temp[temp.count - 1].removeAtIndex(temp[temp.count - 1].endIndex.predecessor())
            var temp2 = [[String]]()
            for array in temp
            {
                temp2.insert(array.componentsSeparatedByString(","), atIndex: temp2.count)
            }
                
            var transactions = [[String: String]]()

            for array in  temp2
            {
                var transaction = [String: String]()
                for array2 in array
                {
                    var temp3 = array2.componentsSeparatedByString(":")
                    transaction.updateValue(temp3[1], forKey: temp3[0])
                }
                transactions.append(transaction)
            }
           print(transactions)
//            let rate = temp[1].componentsSepar
           // self.myLabel.text = rate[0]
            //print(temp)
            }
        }
        task.resume()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

