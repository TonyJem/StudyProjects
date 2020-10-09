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
    
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var allowanceLabel: UILabel!
    
    // MARK: - Start Here:
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.backgroundColor = .white
        colorChangeSwitch.isOn = true
        
        nameTextField.text = ""
        surnameTextField.text = ""
        greetingsTextLabel.text = ""
        
        allowanceLabel.text = ""
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
    
    @IBAction func checkIfCanDrinkMargaritasBtnTapped(_ sender: UIButton) {
        if let age = ageTextField.text {
            let ageInt = Int(age)
            
            if let age = ageInt {
                if age >= 20 {
                    allowanceLabel.text = "Congratulations! You can drink Margaritas in LT! Because your age is above then 19!"
                } else {
                    allowanceLabel.text = "Sorry! You can't drink Margaritas in LT! Because your age is \(age)"
                }
            } else {
                allowanceLabel.text = "Please enter age correctly. You should enter numbers as figures"
            }
        }
    }
}
