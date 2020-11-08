import UIKit

class ContactListVC: UIViewController, UITableViewDataSource{

    

    @IBOutlet weak var tableView: UITableView!
    
    var contact1 = (name: "Monkey1", phone: "+ph1")
    var contact2 = (name: "Monkey2", phone: "+ph2")
    var contact3 = (name: "Monkey3", phone: "+ph3")
    var contact4 = (name: "Monkey4", phone: "+ph4")
    
    var contacts = [(name: String, phone: String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        contacts = [contact1, contact2, contact3, contact4]

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactViewCell", for: indexPath) as! ContactViewCell
    
        let contactForCurrentRow = contacts[indexPath.row]

        cell.nameLabel.text = contactForCurrentRow.name
        cell.phoneLabel.text = contactForCurrentRow.phone
        
        return cell
    }

    
    @IBAction func addButtonTApped(_ sender: UIBarButtonItem) {
        
        print("Add button clicked")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
