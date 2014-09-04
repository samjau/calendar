//
//  ViewController.swift
//  Calendar
//
//  Created by Sam Jau on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monthLabelView: UIView!
    @IBOutlet weak var monthImageView: UIImageView!
    @IBOutlet weak var weekImageView: UIImageView!
    @IBOutlet weak var dayImageView: UIImageView!
    @IBOutlet weak var dayView: UIView!
    var dayViewOrigY: CGFloat!
    var dayImageViewOrigY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monthImageView.alpha = 0
        monthLabelView.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onDayPanGesture(panGesture: AnyObject) {
        var translation = panGesture.translationInView(view)
        var point = panGesture.locationInView(view)
        var velocity = panGesture.velocityInView(view)
        
        if panGesture.state == UIGestureRecognizerState.Began {
//            println("Began: \(dayImageView.center.y)")
            dayViewOrigY = dayView.center.y
            dayImageViewOrigY = dayImageView.center.y
        } else if panGesture.state == UIGestureRecognizerState.Changed {
            println("img: \(dayImageView.center.y)")
            println("View: \(dayView.center.y)")
            UIView.animateWithDuration(0.1, delay: 0, options: nil, animations: {
                self.dayImageView.center.y = self.dayImageViewOrigY + translation.y
                }, completion: nil)
            
            
        } else if panGesture.state == UIGestureRecognizerState.Ended {
        }
    }
    
    @IBAction func onTapCal(sender: AnyObject) {
        expandCal()
    }
    
    func expandCal(){
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.98, initialSpringVelocity: 10, options: nil, animations: {
                self.dayView.center.y = 530
                self.weekImageView.center.y = 77+140
                self.weekImageView.alpha = 0
                self.monthImageView.alpha = 1
                self.monthLabelView.alpha = 1
        }, completion: nil)

    }
    func gestureRecognizer(scrollView: UIScrollView!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    
}

