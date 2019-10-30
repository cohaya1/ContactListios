//
//  ContactsViewController.swift
//  MyContactList
//
//  Created by Makaveli Ohaya on 10/20/19.
//  Copyright © 2019 Makaveli Ohaya. All rights reserved.
//

import UIKit


class ContactsViewController: UIViewController{
@IBOutlet weak var scrollview: UIScrollView!

    @IBOutlet weak var sgmtSwitchEditMode: UISwitch!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Zip: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var Home: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Change: UIButton!
    @IBOutlet weak var BirthDate: UILabel!
    @IBOutlet weak var Cell: UITextField!
    
    @IBOutlet weak var State: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.changeSwitchmode(self)
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
   /*
    @IBAction func changeEditMode(_ sender: Any) {
        let textFields: [UITextField] = [Name, Address, City,State, Zip, Home, Cell, Email]
        if sgmtEditMode.selectedSegmentIndex == 0 { //View Mode
            for textField in textFields {
                textField.isEnabled = false
                textField.borderStyle = UITextBorderStyle.none
            }
            Change.isHidden = true
            navigationItem.rightBarButtonItem = nil
        }
        else if sgmtEditMode.selectedSegmentIndex == 1{ //Edit Mode
            for textField in textFields {
                textField.isEnabled = true
                textField.borderStyle = UITextBorderStyle.roundedRect
            }
            Change.isHidden = false
            
        }
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)),
                                               name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardInfo = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
        let keyboardSize = keyboardInfo.cgRectValue.size
        
        
        var contentInset = self.scrollviewscrollview.contentInset
        contentInset.bottom = keyboardSize.height
        
        self.scrollView.contentInset = contentInset
        self.scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        var contentInset = self.scrollview.contentInset
        contentInset.bottom = 0
        
        self.scrollview.contentInset = contentInset
        self.scrollview.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    

    @IBAction func changeSwitchmode(_ sender: Any) {
        let textFields2: [UITextField] = [ Name,Address,City,State,Zip,Home,Cell,Email]
        if ((sender as AnyObject).isOn == true){
            for textField2 in textFields2 {
                textField2.isEnabled = true
                textField2.borderStyle = UITextBorderStyle.roundedRect
            }
            Change.isHidden = false
        }
        else {
            for textField2 in textFields2 {
                textField2.isEnabled = false
                textField2.borderStyle = UITextBorderStyle.none
            }
            Change.isHidden = true
            navigationItem.rightBarButtonItem = nil
            
            
            
        }
    }
    
   
    

}


