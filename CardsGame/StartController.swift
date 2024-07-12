//
//  StartController.swift
//  CardsGame
//
//  Created by ahmad zhalka on 14/07/2024.
//

import Foundation
import UIKit
class StartController: UIViewController {
    var receivedString: String!
    @IBOutlet weak var Start_BTN_start: UIButton!
    @IBOutlet weak var Start_LBL_name: UILabel!
    private var isStringSetOnce = false

    @IBOutlet weak var start_BTN_exit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.frame = CGRect(x: 20, y: 100, width: self.view.bounds.width - 40, height: 300)

        Start_LBL_name.text=receivedString
    }
    @IBAction func Start_BTN_start(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              if let secondVC = storyboard.instantiateViewController(withIdentifier: "GameController") as? GameController {
                  secondVC.receivedString = receivedString
                  self.present(secondVC, animated: true, completion: nil)
              }
    }
    
       func setReceivedString(_ newString: String) {
           // Check if the string has already been set once
           if !isStringSetOnce {
               receivedString = newString
              // Start_LBL_name.text = receivedString
               isStringSetOnce = true
           } else {
               // Reset the flag after some delay or condition
               DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
                   self?.isStringSetOnce = false
               }
           }
       }
    
    @IBAction func start_BTN_exit(_ sender: Any) {
        exit(0)
    }
    
}
