import UIKit

class CardGameViewController: UIViewController {
    //    MARK: - Outlets
    @IBOutlet var cardButtonsTapped: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //    MARK: - Properties
    var cardsSymbols = ["🐶","🐱","🐭","🐰","🦊","🐸","🐶","🐱","🐭","🐰","🦊","🐸" ]
    
    var lastSelectedCardIndex = -1
    
    var savedResults = [Int]()
    
    var matchedCards = 0 {
        didSet{
            checkResults ()
        }
    }
    
    var curentScore = 0 {
        didSet{
            setScoreLabel()
        }
    }
    
    
    //    MARK: - StartHere
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCardAppearance()
        
        setScoreLabel()
    }
    
    
    //    MARK: - Methods
    func setScoreLabel(){
        scoreLabel.text = "Score: \(curentScore)"
    }
    
    func showResults(){
        performSegue(withIdentifier: "ShowGameResultVC_Segue", sender: nil)
    }
    
    func checkResults (){
        if matchedCards == cardsSymbols.count{
            savedResults.append(curentScore)
            showResults()
            resetCards()
        }
    }
    
    func resetCards(){
        curentScore = 0
        for button in cardButtonsTapped {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        cardsSymbols.shuffle()
    }
    
    //    MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowGameResultVC_Segue" {
            // Get the new view controller using segue.destination.
            let destinationVC = segue.destination as! ShowGameResultViewController
            
            // Pass the selected object to the new view controller.
            destinationVC.gameResult = self.curentScore
        }
        
        if segue.identifier == "ShowTableWithResultsSegue" {
            // Get the new view controller using segue.destination.
            let destinationVC = segue.destination as! ShowResultsInTableVC
            
            // Pass the selected object to the new view controller.
            destinationVC.updatedResults = self.savedResults
        }
        
    }
    
    
    //    MARK: - Actions
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetCards()
    }
    
    
    @IBAction func cardTapAction(_ sender: UIButton) {
        let cardIndex = cardButtonsTapped.firstIndex(of: sender)!
        let selectedCardSymbol = cardsSymbols[cardIndex]
        
        UIView.transition(
            with: sender,
            duration: 0.3,
            options: [.transitionFlipFromRight]) {
        } completion: { _ in
        }
        
        if lastSelectedCardIndex == -1 {
            lastSelectedCardIndex = cardIndex
            sender.setTitle(selectedCardSymbol, for: .normal)
            sender.isEnabled = false
        } else if lastSelectedCardIndex != cardIndex {
            let lastCardSymbol = cardsSymbols[lastSelectedCardIndex]
            
            if lastCardSymbol == selectedCardSymbol { // Two Cards Matched OK
                sender.setTitle(selectedCardSymbol, for: .normal)
                sender.isEnabled = false
                curentScore += 3
                matchedCards += 2
                
            } else {
                sender.setTitle(selectedCardSymbol, for: .normal)
                sender.isEnabled = false
                
                curentScore -= 1
                if curentScore < 0 {
                    curentScore = 0
                }
                
                let lastCardIndex = lastSelectedCardIndex
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    sender.setTitle("", for: .normal)
                    sender.isEnabled = true
                    
                    let lastCardButton = self.cardButtonsTapped[lastCardIndex]
                    lastCardButton.setTitle("", for: .normal)
                    lastCardButton.isEnabled = true
                }
            }
            lastSelectedCardIndex = -1
        }
    }
    
    //    MARK: - Setup
    
    func setupCardAppearance(){
        for button in cardButtonsTapped {
            button.layer.cornerRadius = 8
        }
    }
}
