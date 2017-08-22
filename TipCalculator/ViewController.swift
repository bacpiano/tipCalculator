//
//  ViewController.swift
//  TipCalculator
//
//  Created by Adrian Borcea on 6/22/17.
//  Copyright © 2017 Adrian Borcea. All rights reserved.
//
import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet var settingsView: DesignableView!
  @IBOutlet weak var defaultTipSegmentedControl: DesignableSegmentedControl!
  
  var tipPercentage = 0.18
  
  @IBOutlet weak var billLabel: UILabel!
  @IBOutlet weak var billAmountTextField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var tipAmountLabel: UILabel!
  
  @IBOutlet weak var tipPercentageSegmentedControl: UISegmentedControl!
  
  @IBOutlet weak var separatorView: UIView!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
    
  var tip: Tip?
    var tips: [Tip] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tip = Tip(context: context)
    fetchData()
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
     if settingsView.isDescendant(of: view) {
          settingsView.removeFromSuperview()
     }
  }
  @IBAction func calculateTip(_ sender: UITextField) {
    let bill = Double(billAmountTextField.text!) ?? 0
    let tip = bill * tipPercentage
    let total = bill + tip
    
    tipAmountLabel.text = "$\(tip)"
    totalAmountLabel.text = "$\(total)"
  }
  
  @IBAction func settingsButtonPressed(_ sender: UIButton) {
    let settingsViewWidth: CGFloat = 240
    let settingsViewHeight: CGFloat = 128
    settingsView.frame = CGRect(x: UIScreen.main.bounds.width / 2 - settingsViewWidth / 2, y: UIScreen.main.bounds.height / 2 - settingsViewHeight / 2, width: settingsViewWidth, height: settingsViewHeight)
    view.addSubview(settingsView)
  }
  
  func insertData() {
    tip?.defaultPercentage = globalTipPercentageValue
    appDelegate.saveContext()
  }
  func fetchData() {
    do {
      //this retrieves the saved coreData and places it into the data variable - which is in this case an array of strings.
        let tipFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Tip")
      tips = try context.fetch(tipFetch) as! [Tip]
        tip = tips[0]
    }
    catch {
      //handle the error here
      print("There was an error fetching")
    }
    //    if data.count > 1 {
    //      data[0] = data.last!
    //    }
    if tip?.defaultPercentage == 0.18 {
      tipPercentageSegmentedControl.selectedSegmentIndex = 0
      defaultTipSegmentedControl.selectedSegmentIndex = 0
      print("18%")
    }
    else if tip?.defaultPercentage == 0.2 {
      tipPercentageSegmentedControl.selectedSegmentIndex = 1
      defaultTipSegmentedControl.selectedSegmentIndex = 1
      print("20%")
      
    }
    else if tip?.defaultPercentage == 0.25 {
      tipPercentageSegmentedControl.selectedSegmentIndex = 2
      defaultTipSegmentedControl.selectedSegmentIndex = 2
      print("25%")
      
    }
    
  }
  
  
  
  var globalTipPercentageValue: Double = 0
  @IBAction func defaultTipChanged(_ sender: DesignableSegmentedControl) {
    //these are initializing the attributes of the entity defined in the xcdatamodel
    switch sender.selectedSegmentIndex {
    case 0:
      globalTipPercentageValue = 0.18
     tipPercentageSegmentedControl.selectedSegmentIndex = 0
    case 1:
      globalTipPercentageValue = 0.20
      tipPercentageSegmentedControl.selectedSegmentIndex = 1

    default:
      globalTipPercentageValue = 0.25
      tipPercentageSegmentedControl.selectedSegmentIndex = 2

    }
    insertData()
    print("data inserted. segmented control has been saved to \(globalTipPercentageValue)")
    
    
  }
}



