//
//  GameController.swift
//  CardsGame
//
//  Created by ahmad zhalka on 15/07/2024.
//

import Foundation
import UIKit
import CoreLocation

class GameController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var game_LBL_timer: UILabel!
    var timer: Timer?
    var remainingSeconds: Int = 5
    var count: Int = 0
    let maxCount: Int = 10
    var cardBackTimer: Timer?
    var countWest: Int=0
    var countEast: Int=0
    @IBOutlet weak var game_LBL_west: UILabel!
    @IBOutlet weak var game_LBL_east: UILabel!
    var withoutPrefix :String!
    @IBOutlet weak var game_LBL_eastLabel: UILabel!
    @IBOutlet weak var game_LBL_westLabel: UILabel!
    var receivedString: String?
    private let cards=[#imageLiteral(resourceName: "9_of_spades.png"), #imageLiteral(resourceName: "1_of_clubs.png"), #imageLiteral(resourceName: "1_of_diamonds.png"), #imageLiteral(resourceName: "1_of_hearts.png"), #imageLiteral(resourceName: "1_of_spades.png"), #imageLiteral(resourceName: "2_of_diamonds.png"), #imageLiteral(resourceName: "2_of_hearts.png"), #imageLiteral(resourceName: "2_of_spades.png"), #imageLiteral(resourceName: "3_of_diamonds.png"), #imageLiteral(resourceName: "3_of_hearts.png"), #imageLiteral(resourceName: "3_of_spades.png"), #imageLiteral(resourceName: "4_of_clubs.png"), #imageLiteral(resourceName: "4_of_diamonds.png"), #imageLiteral(resourceName: "4_of_hearts.png"), #imageLiteral(resourceName: "4_of_spades.png"), #imageLiteral(resourceName: "5_of_clubs.png"), #imageLiteral(resourceName: "5_of_diamonds.png"), #imageLiteral(resourceName: "5_of_spades.png"), #imageLiteral(resourceName: "6_of_clubs.png"), #imageLiteral(resourceName: "6_of_diamonds.png"), #imageLiteral(resourceName: "6_of_hearts.png"), #imageLiteral(resourceName: "7_of_clubs.png"), #imageLiteral(resourceName: "7_of_diamonds.png"), #imageLiteral(resourceName: "7_of_hearts.png"), #imageLiteral(resourceName: "7_of_spades.png"), #imageLiteral(resourceName: "8_of_clubs.png"), #imageLiteral(resourceName: "8_of_diamonds.png"), #imageLiteral(resourceName: "8_of_hearts.png"), #imageLiteral(resourceName: "8_of_spades.png"), #imageLiteral(resourceName: "9_of_clubs.png"), #imageLiteral(resourceName: "9_of_diamonds.png"), #imageLiteral(resourceName: "9_of_hearts.png"), #imageLiteral(resourceName: "10_of_clubs.png"), #imageLiteral(resourceName: "10_of_diamonds.png"), #imageLiteral(resourceName: "10_of_hearts.png"), #imageLiteral(resourceName: "10_of_spades.png"), #imageLiteral(resourceName: "11_of_clubs.png"), #imageLiteral(resourceName: "11_of_diamonds.png"), #imageLiteral(resourceName: "11_of_hearts.png"), #imageLiteral(resourceName: "11_of_spades.png"), #imageLiteral(resourceName: "12_of_clubs.png"), #imageLiteral(resourceName: "12_of_diamonds.png"), #imageLiteral(resourceName: "12_of_hearts.png"), #imageLiteral(resourceName: "12_of_spades.png"), #imageLiteral(resourceName: "13_of_clubs.png"), #imageLiteral(resourceName: "13_of_diamonds.png"), #imageLiteral(resourceName: "13_of_hearts.png"), #imageLiteral(resourceName: "13_of_spades.png")
    ]
    private let cardValues: [Int] = [
           9, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13
       ]
    
    
    let middle = 34.817549168324334
    //location
    private var locationManager:CLLocationManager?
    var lat : Double!
    
    @IBOutlet weak var game_IMG_east: UIImageView!
    @IBOutlet weak var game_IMG_west: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //make subString
        game_LBL_west.text="0"
        game_LBL_east.text="0"
        locationManager = CLLocationManager()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
        updateCards()
        startTimer()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            lat = location.coordinate.latitude
            if(lat>middle){
               
                withoutPrefix = (receivedString?.replacingOccurrences(of: "hi ", with: ""))
                game_LBL_eastLabel.text = withoutPrefix
                game_LBL_eastLabel.textColor = UIColor.green
                game_LBL_westLabel.text = "PC"
            }else{
                withoutPrefix = (receivedString?.replacingOccurrences(of: "hi ", with: ""))
                game_LBL_westLabel.text = withoutPrefix
                game_LBL_westLabel.textColor = UIColor.green
                game_LBL_eastLabel.text = "PC"
            }

        }
    }
    
    func  getCard()->Int{
        return Int.random(in: 0...47)
    }
    func startTimer() {
        // Schedule the timer to fire every second
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
         
    }
    @objc func updateTimer() {
        remainingSeconds -= 1
        game_LBL_timer.text = "\(remainingSeconds)"
            if remainingSeconds <= 0 {
                count += 1
                   if count >= maxCount {
                       timer?.invalidate()
                       game_LBL_timer.text = "game end!"
                       game_IMG_west.image = #imageLiteral(resourceName: "crdBack.jpeg")
                       game_IMG_east.image = #imageLiteral(resourceName: "crdBack.jpeg")
                       showResultPage()
                       return
                   }
                   remainingSeconds = 5
                   game_LBL_timer.text = "Resetting..."
                showCardBacks()
                
               }
        
      }
    func showCardBacks() {
        game_IMG_west.image = #imageLiteral(resourceName: "crdBack.jpeg")
        game_IMG_east.image = #imageLiteral(resourceName: "crdBack.jpeg")
        cardBackTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(resetCards), userInfo: nil, repeats: false)
    }
    @objc func resetCards() {
        updateCards()
    }

      deinit {
          // Invalidate the timer when the view controller is deallocated
          timer?.invalidate()
      }
    func updateCards() {
        let cardIndexWest = getCard()
        let cardIndexEast = getCard()
        game_IMG_west.image = cards[cardIndexWest]
        game_IMG_east.image = cards[cardIndexEast]
        
        // Compare the cards and display the result
        let cardValueWest = cardValues[cardIndexWest]
        let cardValueEast = cardValues[cardIndexEast]
               
        if cardValueWest > cardValueEast {
            //game_LBL_result.text = "West wins!"
            countWest+=1
            game_LBL_west.text =  "\(countWest)"
        } else if cardValueWest < cardValueEast {
            countEast+=1
            game_LBL_east.text =  "\(countEast)"
            //game_LBL_result.text = "East wins!"
        } else {
            //game_LBL_result.text = "It's a tie!"
        }
    }
    func showResultPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              if let secondVC = storyboard.instantiateViewController(withIdentifier: "ScoreController") as? ScoreController {
                  if(countWest>countEast){
                      secondVC.receivedStringwinner = "winner: " + game_LBL_westLabel.text!
                      secondVC.receivedStringscore =  "score: " + "\(countWest)"
                  }else{
                      secondVC.receivedStringwinner = "winner: " + game_LBL_eastLabel.text!
                      secondVC.receivedStringscore = "score: " + "\(countEast)"
                  }
                  secondVC.receivedStringPlayer = withoutPrefix
                  self.present(secondVC, animated: true, completion: nil)

              }
    }
    


}
