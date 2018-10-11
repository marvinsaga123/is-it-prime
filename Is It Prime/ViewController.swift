//
//  ViewController.swift
//  Is It Prime
//
//  Created by Marvin Sagastume on 10/3/18.
//  Copyright © 2018 Innovaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var isItPrimeButton: UIButton!
    @IBOutlet weak var resultMessage: UILabel!
    
    @IBAction func userPressesIsItPrimeButton(_ sender: Any) {
        let input = userInput.text!
        
        if input == "" {
            resultMessage.text = "Please enter a positive whole number!"
        } else if Double(input) == nil {
            resultMessage.text = "Please enter a positive whole number!"
        } else if Double(input)! <= 0 {
            resultMessage.text = "Please enter a positive whole number!"
        } else if Double(input)! / Double(Int(Double(input)!)) != 1.0 {
            resultMessage.text = "Please enter a positive whole number!"
        } else {
            resultMessage.text = determineIfNumberIsPrime(input: Int(Double(input)!))
        }
    }
    
    // determines if the passed in positive integer (not equal to 0 or 1) is a prime number
    func determineIfNumberIsPrime(input: Int) -> String {
        let treshold = Int(floor(sqrt(Double(input))))
        var i = 2
        var resultMessage = ""
        
        if input == 1 {
            resultMessage = "The provided number is not prime!"
        } else if treshold < 2 {
            resultMessage = "The provided number is prime!"
        } else {
            while i <= treshold {
                if (i != 2 && i % 2 == 0 && i != treshold) {
                    i += 1
                    continue
                } else if (input % i == 0) {
                    resultMessage = "The provided number is not prime!"
                    break
                } else if (i == treshold) {
                    resultMessage = "The provided number is prime!"
                    break
                }
                i += 1
            }
        }
        
        return resultMessage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
