import UIKit

class ShowResultsInTableVC: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var pointsListTableView: UITableView!
    
    var updatedResults = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointsListTableView.dataSource = self
    }


    
//    MARK: TableSetup
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updatedResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pointsListTableView.dequeueReusableCell(withIdentifier: "PointsCell", for: indexPath) as! PointsCell
        let currentScore = updatedResults[indexPath.row]
        cell.pointLabel.text = String(currentScore)
        return cell
    }
}
