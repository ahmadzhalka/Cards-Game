//
//  ViewController.swift
//  CardsGame
//
//  Created by ahmad zhalka on 12/07/2024.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var main_TXT_insertName: UITextField!
    @IBOutlet weak var main_BTN_submit: UIButton!
    private let cards=[#imageLiteral(resourceName: "9_of_spades.png"), #imageLiteral(resourceName: "1_of_clubs.png"), #imageLiteral(resourceName: "1_of_diamonds.png"), #imageLiteral(resourceName: "1_of_hearts.png"), #imageLiteral(resourceName: "1_of_spades.png"), #imageLiteral(resourceName: "2_of_diamonds.png"), #imageLiteral(resourceName: "2_of_hearts.png"), #imageLiteral(resourceName: "2_of_spades.png"), #imageLiteral(resourceName: "3_of_diamonds.png"), #imageLiteral(resourceName: "3_of_hearts.png"), #imageLiteral(resourceName: "3_of_spades.png"), #imageLiteral(resourceName: "4_of_clubs.png"), #imageLiteral(resourceName: "4_of_diamonds.png"), #imageLiteral(resourceName: "4_of_hearts.png"), #imageLiteral(resourceName: "4_of_spades.png"), #imageLiteral(resourceName: "5_of_clubs.png"), #imageLiteral(resourceName: "5_of_diamonds.png"), #imageLiteral(resourceName: "5_of_spades.png"), #imageLiteral(resourceName: "6_of_clubs.png"), #imageLiteral(resourceName: "6_of_diamonds.png"), #imageLiteral(resourceName: "6_of_hearts.png"), #imageLiteral(resourceName: "7_of_clubs.png"), #imageLiteral(resourceName: "7_of_diamonds.png"), #imageLiteral(resourceName: "7_of_hearts.png"), #imageLiteral(resourceName: "7_of_spades.png"), #imageLiteral(resourceName: "8_of_clubs.png"), #imageLiteral(resourceName: "8_of_diamonds.png"), #imageLiteral(resourceName: "8_of_hearts.png"), #imageLiteral(resourceName: "8_of_spades.png"), #imageLiteral(resourceName: "9_of_clubs.png"), #imageLiteral(resourceName: "9_of_diamonds.png"), #imageLiteral(resourceName: "9_of_hearts.png"), #imageLiteral(resourceName: "10_of_clubs.png"), #imageLiteral(resourceName: "10_of_diamonds.png"), #imageLiteral(resourceName: "10_of_hearts.png"), #imageLiteral(resourceName: "10_of_spades.png"), #imageLiteral(resourceName: "11_of_clubs.png"), #imageLiteral(resourceName: "11_of_diamonds.png"), #imageLiteral(resourceName: "11_of_hearts.png"), #imageLiteral(resourceName: "11_of_spades.png"), #imageLiteral(resourceName: "12_of_clubs.png"), #imageLiteral(resourceName: "12_of_diamonds.png"), #imageLiteral(resourceName: "12_of_hearts.png"), #imageLiteral(resourceName: "12_of_spades.png"), #imageLiteral(resourceName: "13_of_clubs.png"), #imageLiteral(resourceName: "13_of_diamonds.png"), #imageLiteral(resourceName: "13_of_hearts.png"), #imageLiteral(resourceName: "13_of_spades.png")
    ]
    
    @IBOutlet weak var main_LBL_westSide: UILabel!
    
    @IBOutlet weak var main_LBL_eastSide: UILabel!
    var stringToSend: String = ""
    @IBOutlet weak var main_IMG_westSide: UIImageView!
    @IBOutlet weak var mani_IMG_east: UIImageView!
    //location
    private var locationManager:CLLocationManager?
    var lat : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //location
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
    }
   
    
    @IBAction func main_BTN_submit(_ sender: UIButton) {
        
       
        main_LBL_eastSide.isHidden=true
        main_LBL_westSide.isHidden=true
        stringToSend="hi "+main_TXT_insertName.text!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              if let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? StartController {
                  secondVC.receivedString = stringToSend
                  self.present(secondVC, animated: true, completion: nil)
              }
       
        main_TXT_insertName.isHidden=true
        main_BTN_submit.isHidden=true
       }
  
 
   
}
