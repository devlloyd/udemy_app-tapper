//
//  ViewController.swift
//  app-tapper
//
//  Created by Devon Lloyd on 4/6/17.
//  Copyright © 2017 Devon Lloyd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Properties (variables)
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        logoImg.isHidden = false
        playButton.isHidden = false
        howManyTapsTxt.isHidden = false
        
        tapButton.isHidden = true
        tapsLabel.isHidden = true
    }
    
    @IBAction func onPlayButtonPress(sender: UIButton!) {
      
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            logoImg.isHidden = true
            playButton.isHidden = true
            howManyTapsTxt.isHidden = true
            
            tapButton.isHidden = false
            tapsLabel.isHidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
        
    }

    @IBAction func onCoinTapped(sender: UIButton) {
        currentTaps += 1
        updateTapsLabel()
        if isGameOver() == true {
            restartGame()
        }
    }
}


