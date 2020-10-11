import UIKit

class ReceiptsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var receiptsTableView: UITableView!
    
    var receiptsImages = [
        UIImage(named: "zzzEgg"),
        UIImage(named: "whiteEgg"),
        UIImage(named: "blueEgg"),
        UIImage(named: "yellowEgg"),
        UIImage(named: "orangeEgg"),
        UIImage(named: "redEgg"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receiptsTableView.dataSource = self
        receiptsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        receiptsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rowCellTappedSegue" {
            if let indexPath = self.receiptsTableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! ImageEggViewController
                
                if let selectedImage = receiptsImages[indexPath.row]{
                    destinationVC.mainImage = selectedImage
                }
            }
        }
    }
    
    // MARK: - TableSetup:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptsImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let receiptCell = receiptsTableView.dequeueReusableCell(withIdentifier: "ReceiptTableCell", for: indexPath) as! ReceiptTableCell
        let ImageInCurrentRow = receiptsImages[indexPath.row]
        receiptCell.receiptImage.image = ImageInCurrentRow
        return receiptCell
    }
}
