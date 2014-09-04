//
//  SecondViewController.swift
//  modalTransitions
//
//  Created by Sam Jau on 8/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
      
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
            isPresenting = true
            return self
        }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
            isPresenting = false
            return self
        }
    
    func transitionDuration(transitionContext:UIViewControllerContextTransitioning!) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext:UIViewControllerContextTransitioning!){
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        containerView.addSubview(toViewController.view)
        
        if isPresenting == true {
            toViewController.view.transform = CGAffineTransformMakeScale(0,0)
        } else {
            println("asdfadf")
        }
        
        UIView.animateWithDuration(1, animations: {
            if self.isPresenting == true {
                toViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
            } else {
                println(":P")
                toViewController.view.transform = CGAffineTransformMakeScale(0,0)
            }
            }, completion: {(finished:Bool) -> Void in transitionContext.completeTransition(true)
        })
    }
}
