//
//  AZBlinds.swift
//  AZBlinds
//
//  Created by Mohammad AZam on 3/16/15.
//  Copyright (c) 2015 Mohammad Azam. All rights reserved.
//

import UIKit

class AZBlinds: UIView {

    // UIKit Dynamics 
    let _animator :UIDynamicAnimator?
    var _gravity :UIGravityBehavior?
    var _collision :UICollisionBehavior?
    var _itemBehavior :UIDynamicItemBehavior?
    
    let _options :NSArray?
    var _spacingY :CGFloat = 100
    
    init(options :NSArray) {
        
        super.init()
        
        _options = options
        _animator = UIDynamicAnimator(referenceView: self)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func createBlind(option :NSString) -> UIView {
        
        let blind = UIView(frame:CGRectMake(80, _spacingY, 200, 44))
        blind.layer.borderWidth = 1.0;
        blind.layer.borderColor = UIColor.whiteColor().CGColor
        
        let optionTitleLabel = UILabel(frame: CGRectMake(0, 0, blind.bounds.size.width, blind.bounds.size.height))
        optionTitleLabel.text = option
        optionTitleLabel.textColor = UIColor.whiteColor()
        optionTitleLabel.textAlignment = .Center
        
        blind.addSubview(optionTitleLabel)
        
        _spacingY += 60
        return blind
        
    }
    
    func createBarrier(blind :UIView) -> UIView {
        
        let barrier = UIView(frame: CGRectMake(blind.frame.origin.x, blind.frame.origin.y - 50 + _spacingY, 200, 2))
        return barrier
    }
    
    func addCollisionToBlind(blind: UIView, barrier :UIView) {
        
        _collision = UICollisionBehavior(items: [blind])
        
        _collision?.addBoundaryWithIdentifier("BlindBarrierBoundary", fromPoint: CGPointMake(barrier.frame.origin.x, barrier.frame.origin.y), toPoint: CGPointMake(barrier.frame.width, barrier.frame.origin.y))
        
        _animator?.addBehavior(_collision)
    }
    
    func addGravityToBlind(blind :UIView) {
        
        _gravity = UIGravityBehavior(items: [blind])
        _animator?.addBehavior(_gravity)
        
    }
    
    func addItemBehaviorToBlind(blind :UIView) {
        
        _itemBehavior = UIDynamicItemBehavior(items: [blind])
        _itemBehavior?.elasticity = 0.5
        
        _animator?.addBehavior(_itemBehavior)
    }
    
    func setup() {
        
        var tag = 0
        
        for option in _options! {
            
            let blind = createBlind(option as NSString)
            
            blind.tag = ++tag
            
            self.addSubview(blind)
            
            addGravityToBlind(blind)
            
            let barrier = createBarrier(blind)
            self.addSubview(barrier)
            
            addCollisionToBlind(blind, barrier: barrier)
            addItemBehaviorToBlind(blind)
            registerGestureRecognizer(blind)

        }
    }

    func registerGestureRecognizer(blind :UIView) {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "blindTapped:")
        blind.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func blindTapped(sender :UITapGestureRecognizer) {
        
        println("\(sender.view!.tag)")
        
        println("blind Tapped")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
