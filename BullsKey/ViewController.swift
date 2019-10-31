//
//  ViewController.swift
//  BullsKey
//
//  Created by MacStudent on 2019-10-29.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        Slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        Slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        Slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        //iOS Apprentice Chapter 7: The New Look
        //raywenderlich.com 138
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        Slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
        // slider.value = 80
        // currentValue = Int(slider.value)
        // targetValue = 1 + Int(arc4random_uniform(100))
       // startNewRound()
        // Do any additional setup after loading the view.
        startNewGame()
    }
    @IBAction func Click(_ sender: Any) {
        print("Hello Arun")
        showAlert()
    }
    
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        // add these lines
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        //let message = "You scored \(points) points"
//        let alert = UIAlertController(title: title,  // change this
//            message: message,
//            preferredStyle: .alert)
//        let difference = abs(targetValue - currentValue)
//        let points = 100 - difference
//        score += points  //score = score + points
       let message = "You scored\(points) points" + "\nThe value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe title value is: \(title)"
        //        "\nThe difference is:\(difference)"
        //        "\nThe target value is: \(targetValue)" +
        //        "\nThe difference is:\(difference)"
//        var difference: Int
//        if currentValue > targetValue {
//            difference = currentValue - targetValue
//        } else if targetValue > currentValue {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
//        let message = "The value of the slider is: \(currentValue)" +
//        "\nThe target value is: \(targetValue)" +
//        "\nThe difference is:\(difference)"
    
        
        //let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Hello World",
                                      // raywenderlich.com 70
            //iOS Apprentice Chapter 3: Slider and Labels
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
        handler: { action in self.startNewRound() }
        )
//        let action = UIAlertAction(title: "OK",
//                                   style: .default,
//                                   // changed
//            // changed
//            handler: nil)
        present(alert, animated: true, completion: nil)
        alert.addAction(action)
        //startNewRound()
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(slider.value)")
        print("The value of the slider is now: \(currentValue)")
    }
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 20
        round += 1
        Slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels() {
        target.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)    // add this line
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        // Add the following lines
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 2
        transition.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
        
    }
    @IBAction func startOver() {
       
        startNewGame()
    
    }
}
