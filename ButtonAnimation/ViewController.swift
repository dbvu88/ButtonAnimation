//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by Duc Vu on 11/26/17.
//  Copyright © 2017 Duc Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wiggleBtn: UIButton!
    @IBOutlet weak var dimBtn: UIButton!
    @IBOutlet weak var colorizedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func wiggleBtnPressed(_ sender: Any) {
        wiggleBtn.wiggle()
    }
    
    @IBAction func dimBtnPressed(_ sender: Any) {
        dimBtn.dim()
    }
    @IBAction func colorizedBtnPressed(_ sender: Any) {
        colorizedBtn.colorize()
    }
}

extension UIButton {
    func wiggle() {
        let wiggleAnim = CABasicAnimation(keyPath: "position")
        wiggleAnim.duration = 0.05
        wiggleAnim.repeatCount = 5
        wiggleAnim.autoreverses = true
        wiggleAnim.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        wiggleAnim.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(wiggleAnim, forKey: "position")
    }
    
    func dim() {
        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 0.75
        }) { (finished) in
            UIView.animate(withDuration: 0.15, animations: {
                self.alpha = 1.0
            })
        }
    }
    
    func colorize() {
        let randomNumberArray = randomFloatGenerator(quanity: 3)
        let randomColor = UIColor(red: randomNumberArray[0]/255, green: randomNumberArray[1]/255, blue: randomNumberArray[2]/255, alpha: 1)
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = randomColor
        })
    }
}

func randomFloatGenerator(quanity: Int) -> [CGFloat] {
    var randomNumberArray = [CGFloat]()
    for _ in 1...quanity {
        let randomNumber = CGFloat(arc4random_uniform(255))
        randomNumberArray.append(randomNumber)
    }
    return randomNumberArray
}
