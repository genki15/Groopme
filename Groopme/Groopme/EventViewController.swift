//
//  EventViewController.swift
//  Groopme
//
//  Created by jerome de chillaz on 28/11/2015.
//  Copyright © 2015 jerome de chillaz. All rights reserved.
//

import UIKit
import Parse

class EventViewController: UIViewController {
    @IBOutlet weak var selectOriginalPrice: UITextField!
    @IBOutlet weak var selectNumberOfPeopleNeeded: UITextField!
    @IBOutlet weak var selectName: UITextField!
    @IBOutlet weak var selectLocation: UITextField!
    @IBOutlet weak var selectDate: UIDatePicker!
    @IBOutlet weak var selectDiscountedprice: UITextField!
    @IBAction func createEvent(sender: AnyObject) {
        
        Parse.setApplicationId("k2Eo86ckAVwTH4aSsweB9whMpAPJatV5BS3agUIA", clientKey: "GVftBu7XNCEvOlaAceEdjnozbekQCARDR9gbUiSN")
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy  HH:mm"
        let strDate = dateFormatter.stringFromDate(selectDate.date)
        
        let testObject = PFObject(className: "Event")
        testObject["nameOfEvent"] = selectLocation.text
        testObject["minimumPeople"] = Int(selectNumberOfPeopleNeeded.text!)
        testObject["price"] = Int(selectDiscountedprice.text!)
        testObject["originalPrice"] = Int(selectOriginalPrice.text!)
        testObject["currentPeople"] = 1
        testObject["eventDate"] = strDate
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
            print(testObject.objectId!)
        }
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
