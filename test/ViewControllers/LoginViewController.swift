import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties:
    let correctPassword = "pas"
    
    // MARK: - Outlets:
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Methods:
    func passwordIsCorrect() -> Bool{
        if passwordTextField.text == correctPassword {
            return true
        } else {
            return false
        }
    }
    
    func presentWelcomeViewController(){
        let welcomeVC = storyboard?.instantiateViewController(identifier: "WelcomeViewController") as! WelcomeViewController
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    // MARK: - Actions:
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if passwordIsCorrect(){
            print("login OK")
            presentWelcomeViewController()
        } else {
            print("Password is not correct")
        }
    }
    
}
