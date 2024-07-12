//
//  ScoreController.swift
//  CardsGame
//
//  Created by ahmad zhalka on 15/07/2024.
//

import Foundation
import UIKit
class ScoreController: UIViewController {
    var receivedStringwinner: String?
    var receivedStringscore: String?
    var receivedStringPlayer: String?
    @IBOutlet weak var score_BTN_back: UIButton!
    @IBOutlet weak var score_LBL_score: UILabel!
    @IBOutlet weak var score_LBL_winner: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        score_LBL_score.text = receivedStringscore
        score_LBL_winner.text = receivedStringwinner
    }
    
    @IBAction func score_BTN_back(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let secondVC1 = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? StartController {
                    secondVC1.receivedString = "hi " + receivedStringPlayer!
                    self.present(secondVC1, animated: true, completion: nil)
                } else {
                    print("Error: Could not instantiate view controller with identifier 'SecondViewController'")
                }
        
    }
}
