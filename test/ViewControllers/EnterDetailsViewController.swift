import UIKit

struct User {
    var name: String
    var surname: String
    
    var gender: String?
    var coutnry: String?
    var city: String?
    var street: String?
    var bio: String?
}


class EnterDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    
    var user: User?
    
    
    //    MARK: StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = ""
        surnameTextField.text = ""
        genderTextField.text = ""
        countryTextField.text = ""
        cityTextField.text = ""
        streetTextField.text = ""
        bioTextField.text = ""
        
    }
    
    
    
    
    
    @IBAction func showUserDetailsTapped(_ sender: Any) {
        
        if isNameFieldEmpty() || isSurnameNameFieldEmpty() {
            createEmptyFieldAlert ()
            return
        } else {
            
            performSegue(withIdentifier: "ShowUserDetailsVCSegue", sender: nil)
        }
    }
    
    func isNameFieldEmpty () -> Bool{
        if nameTextField.text != ""{
            return false
        }
        return true
    }
    
    func isSurnameNameFieldEmpty () -> Bool{
        if surnameTextField.text != ""{
            return false
        }
        return true
    }
    
    
    func createEmptyFieldAlert (){
        
        // create the alert
        let alert = UIAlertController(title: "Attention!!!", message: "Fields marked with * are essential! Must to be filled up.", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //    ShowUserDetailsVCSegue
    
    
    
    
    
    
}
