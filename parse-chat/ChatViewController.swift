//
//  ChatViewController.swift
//  parse-chat
//
//  Created by Gideon Goodwin on 9/9/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var loggedInUser: PFUser? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onRefreshMessagesTimer", userInfo: nil, repeats: true)
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

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageTableViewCell", forIndexPath:indexPath) as! MessageTableViewCell
        cell.messageLabel.text = "Fuck"
        return cell
    }

    internal func setUser(user:PFUser!) {
        loggedInUser = user
    }

    func onRefreshMessagesTimer() {
    }
}
