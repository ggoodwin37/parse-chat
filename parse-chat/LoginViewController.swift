//
//  LoginViewController.swift
//  parse-chat
//
//  Created by Gideon Goodwin on 9/9/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var loggedInUser: PFUser? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "duffdevice@yahoo.com"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        let emailText = self.emailTextField.text
        let passwordText = self.passwordTextField.text
        let pfUser = PFUser()
        pfUser.username = emailText
        pfUser.email = emailText
        pfUser.password = passwordText
        pfUser.signUpInBackgroundWithBlock{(succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // TODO put this in UI
                print("Error signing up: \(errorString)")
            } else {
                print("Signup successful")
                self.onLoggedIn(pfUser)
            }
        }
    }

    @IBAction func onSignIn(sender: AnyObject) {
        let emailText = self.emailTextField.text!
        let passwordText = self.passwordTextField.text!

        PFUser.logInWithUsernameInBackground(emailText, password:passwordText) { (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                print("Signin successful")
                self.onLoggedIn(user)
            } else {
                let errorString = error!.userInfo["error"] as? NSString
                print("Error signing up: \(errorString)")
            }
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    func onLoggedIn(user:PFUser!) {
        loggedInUser = user
        performSegueWithIdentifier("ChatSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let chatVC = segue.destinationViewController as? ChatViewController
        if (chatVC != nil) {
            chatVC!.setUser(loggedInUser)
        }
    }

}
