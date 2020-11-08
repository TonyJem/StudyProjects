import UIKit

class TargetViewController: UIViewController {
    @IBOutlet var targetViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawTarget()
    }

    func drawTarget(){
        for view in targetViews{
            view.layer.borderWidth = 8
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.cornerRadius = view.frame.height / 2
        }
    }
}
