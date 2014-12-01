//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Joseph Iwanicki on 11/30/14.
//  Copyright (c) 2014 JosephIwanicki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonsLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var balloons:[Balloon] = []
/* var currentIndex = 0 tracks what index is displayed on the screen so we can increment each time we press the next button  */
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
/* call function createBalloons */
        self.createBalloons()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonBarButtonItemPressed(sender: UIBarButtonItem) {
 /* each time we press the next button we will update to the next index to display to the user. The currentIndex will increase */
        
        let balloon = balloons[currentIndex]
        
/* Using Interpolsation will display number ballon to user */
        balloonsLabel.text = "\(balloon.number) balloon"
        

        backgroundImageView.image = balloon.image
        
        currentIndex += 1
        
    
    }
    
/*creates a for loop which starts at 0 and stops when balloonCount reaches 99. Each time it runs through the for loop it adds 1 to the balloonCount variable. */
    func createBalloons() {
        for var balloonCount = 0; balloonCount <= 99; ++balloonCount {
         
 /*each time we run through the for loop, we create a Balloon instance.  We then assign the balloonCount variable as the value of our number property since the balloonCount will run from 0 to 99 */
            var balloon = Balloon()
           balloon.number = balloonCount
    
            
/*we generate a randomNumber between 0 and 3 */
            
         let randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            
/* Using a switch statement we randomly assign an image to our Balloon instance based on the random number  */
            switch randomNumber {
            case 1:
                balloon.image = UIImage(named: "Redballoon1.jpg")
            case 2:
                balloon.image = UIImage(named: "Redballoon2.jpg")
            case 3:
                balloon.image = UIImage(named: "Redballoon3.jpg")
             default:
                balloon.image = UIImage(named: "Redballoon4.jpg")
                }
            
/* adds the balloon instances to the var balloon = Balloon ()array */
            self.balloons.append(balloon)
        
        
        
        }
      }
}

