//
//  ViewController.swift
//  AZBlinds
//
//  Created by Mohammad AZam on 3/16/15.
//  Copyright (c) 2015 Mohammad Azam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }

    func setup() {
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        let azBlind = AZBlinds(options: ["Romance","Thriller","Comedy","Horror"])
        azBlind.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
        self.view.addSubview(azBlind)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

