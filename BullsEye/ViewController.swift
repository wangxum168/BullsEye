//
//  ViewController.swift
//  BullsEye
//
//  Created by Wang Xu on 2017-12-18.
//  Copyright © 2017 Wang Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
//    var difference: Int = 0
    var currentValue:Int = 50;
    var targetValue:Int = 0;
    var points = 0;
    var score = 0;
    var round = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let difference = abs(currentValue - targetValue)
        points = 100-difference
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)" +
        "\nThe points are \(points)";
        let action = UIAlertAction(title: "Action-OK", style: .default, handler:nil)
        let alert = UIAlertController(title: title,message:message, preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_slider: UISlider){
        currentValue = lroundf(_slider.value)
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()
        currentValue = 50
        slider.value = Float(currentValue)
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

