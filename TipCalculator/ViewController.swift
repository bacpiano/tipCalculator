//
//  ViewController.swift
//  TipCalculator
//
//  Created by Adrian Borcea on 6/22/17.
//  Copyright © 2017 Adrian Borcea. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
  
  var tipPercentage = 0.18
  
  @IBOutlet weak var billLabel: UILabel!
  @IBOutlet weak var billAmountTextField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var tipAmountLabel: UILabel!
  
  @IBOutlet weak var tipPercentageSegmentedControl: UISegmentedControl!
  
  @IBOutlet weak var separatorView: UIView!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    billAmountTextField.becomeFirstResponder()
    billAmountTextField.resignFirstResponder()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
    
    tipPercentageSegmentedControl.layer.masksToBounds = true

  }
  
  func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
      let keyboardHeight = keyboardSize.height
      print("Size is \(keyboardHeight)")
    }
  }
  
  @IBAction func tipPercentageChanged(_ sender: UISegmentedControl) {
    switch tipPercentageSegmentedControl.selectedSegmentIndex {
    case 0:
      tipPercentage = 0.18
    case 1:
      tipPercentage = 0.2
    default:
      tipPercentage = 0.25
    }
    if billAmountTextField.text != "" {
      calculateTip(billAmountTextField)
    }
    
  }
  @IBAction func tapOut(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  @IBAction func calculateTip(_ sender: UITextField) {
    let bill = Double(billAmountTextField.text!) ?? 0
    let tip = bill * tipPercentage
    let total = bill + tip
    
    tipAmountLabel.text = "$\(tip)"
    totalAmountLabel.text = "$\(total)"
  }
  
}
