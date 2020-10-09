//
//  ControlsViewController.swift
//  test
//
//  Created by Office-iMac on 2020-10-09.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

import UIKit

class ControlsViewController: UIViewController {
    
    // MARK: - Outlets:
    
    @IBOutlet var screenView: UIView!
    @IBOutlet var colorChangeSwitch: UISwitch!
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var greetingsTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.backgroundColor = .white
        colorChangeSwitch.isOn = true
        
        nameTextField.text = ""
        surnameTextField.text = ""
        greetingsTextLabel.text = ""
        
    }
    
    // MARK: - Actions:
    @IBAction func printHelloWorldButtonTapped(_ sender: Any) {
        print("Hello World!!!")
    }
    
    @IBAction func checkSwitchBtnTapped(_ sender: UIButton) {
        if colorChangeSwitch.isOn {
            screenView.backgroundColor = .red
        } else {
            screenView.backgroundColor = .white
        }
    }
    
    @IBAction func sayGreetingBtnTapped(_ sender: UIButton) {
        
        var nameString = ""
        var surnameString = ""
        
        if let name = nameTextField.text{
            nameString = name
        }
        
        if let surname = surnameTextField.text{
            surnameString = surname
        }
        
        if nameString + surnameString != "" {
            greetingsTextLabel.text = "Hello \(nameString) \(surnameString) !!!"
        } else {
            greetingsTextLabel.text = "Please enter Name and Surname in fields above!"
        }
    }
}
