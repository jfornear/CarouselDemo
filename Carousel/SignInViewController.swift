//
//  SignInViewController.swift
//  Carousel
//
//  Created by Jesse Fornear on 9/20/14.
//  Copyright (c) 2014 Jesse Fornear. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var formView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Register keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        scrollView.contentInset.top = 0

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onSignInButton(sender: UIButton) {
        
        if (self.emailTextField.text == "") || (self.passwordTextField.text == "") {
            // If email or password are empty fields
            if (self.emailTextField.text == "") {
                // If email is empty
                UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: nil, cancelButtonTitle: "OK").show()
                view.endEditing(true)
            } else if (self.passwordTextField.text == "") {
                // If password is empty
                UIAlertView(title: "Password Required", message: "Please enter your password", delegate: nil, cancelButtonTitle: "OK").show()
                view.endEditing(true)
            }
            
        } else {
            // Signing in...
            var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
            alertView.show()
            delay(2) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.checkPassword()
            }
        }
        
        
    }


    @IBAction func onTapView(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func checkPassword() {
        if (self.emailTextField.text == "jessefornear@gmail.com") && (self.passwordTextField.text == "password") {
            // If email and password is correct, login
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            self.performSegueWithIdentifier("loginSegue", sender: self)
            
        } else {
            // Incorrect email or password
            UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "OK").show()
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.scrollView.contentInset.top = -140


            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.scrollView.contentInset.top = 0
            
            }, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
