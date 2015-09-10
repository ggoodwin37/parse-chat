//
//  ChatViewController.swift
//  parse-chat
//
//  Created by Gideon Goodwin on 9/9/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    var loggedInUser: PFUser? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPost(sender: AnyObject) {
        let messageText = messageTextField.text!
        let messageObject = PFObject(className: "Message")
        messageObject["text"] = messageText
        messageObject.saveInBackgroundWithBlock{(succeeded: Bool, error: NSError?) -> Void in
            if (succeeded) {
                print("post success")
            } else {
                print("post failed")
            }
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    internal func setUser(user:PFUser!) {
        loggedInUser = user
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
