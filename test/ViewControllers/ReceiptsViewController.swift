//
//  ReceiptsViewController.swift
//  test
//
//  Created by Anton on 2020-10-09.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

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
        
        loadTable()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "rowCellTappedSegue"){
            let pictureToShowVC = segue.destination as! ImageEggViewController
            print("segue is working!")
            
//            pictureToShowVC.imageEgg.image = UIImage(named: "zzzEgg")
        }
    }
    
    
    // MARK: - TableSetup:
    func loadTable() {
        receiptsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptsImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let receiptCell = receiptsTableView.dequeueReusableCell(withIdentifier: "ReceiptTableCell", for: indexPath) as! ReceiptTableCell
        
        let ImageInCurrentRow = receiptsImages[indexPath.row]
        
        receiptCell.receiptImage.image = ImageInCurrentRow
        
        return receiptCell
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
