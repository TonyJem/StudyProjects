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
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        // MARK: - Actions:
    @IBAction func printHelloWorldButtonTapped(_ sender: Any) {
        print("Hello World!!!")
    }
    
    @IBAction func checkSwitchBtnTapped(_ sender: UIButton) {

        
    }
    
    
    
    
}
