//
//  ViewController.swift
//  AZBlinds
//
//  Created by Mohammad AZam on 3/16/15.
//  Copyright (c) 2015 Mohammad Azam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _label :UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }

    func setup() {
        
        _label = UILabel(frame: CGRectMake(0, self.view.frame.height - 20, self.view.frame.width, 22))

        _label?.textColor = UIColor.whiteColor()
        _label!.textAlignment = .Center
        _label?.center = CGPointMake(self.view.center.x, _label!.frame.origin.y)
        
        self.view.addSubview(_label!)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "restart:")
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func restart(recognizer :UITapGestureRecognizer) {
        
        // start animation 
        showBlinds()
        
    }
    
    func showBlinds() {
        
        // remove the blind if already inserted
        self.view.viewWithTag(100)?.removeFromSuperview()
        
        let azBlind = AZBlinds(options: ["Romance","Thriller","Comedy","Horror"])
        azBlind.tag = 100
        azBlind.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 20)
        azBlind.blindSelected = {(index :Int) -> () in
        
            self._label!.text = "You selected index \(index)"

        }
        
        
        self.view.addSubview(azBlind)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

