//
//  TimeView.swift
//  team6_finalproject
//
//  Created by Shaomik Sarkar on 11/30/16.
//  Copyright © 2016 Shaomik Sarkar. All rights reserved.
//  Source reference: http://rshankar.com/simple-stopwatch-app-in-swift/
//  Source reference: https://www.codementor.io/swift/tutorial/ios-development-facebook-twitter-sharing

import UIKit

import Social

class TimeView: UIViewController {
    
    var startTime = NSTimeInterval()
    
    var timer = NSTimer()
    
    @IBOutlet weak var animeButton: UIButton!
    
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var but3: UIButton!
    @IBOutlet weak var but2: UIButton!
    @IBOutlet weak var but4: UIButton!
    
    @IBOutlet weak var but7: UIButton!
    @IBOutlet weak var but6: UIButton!
    @IBOutlet weak var but5: UIButton!
    @IBAction func begin(sender: AnyObject) {
        if !timer.valid {
         timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(TimeView.update), userInfo: nil, repeats: true)
         startTime = NSDate.timeIntervalSinceReferenceDate()
        }
        
        UIView.animateWithDuration(3.0, delay: 0.0, options: [.CurveEaseIn, .Autoreverse, .Repeat], animations: {
            self.animeButton.transform = CGAffineTransformMakeScale (1, 18)
            }, completion: { finished in
                UIView.animateWithDuration(3.0, delay: 0.0, options:  [.CurveEaseOut, .Autoreverse, .Repeat], animations: {
                    self.animeButton.transform = CGAffineTransformIdentity
                    }, completion: nil
                )
            }
        )
        
        
    }
    
    @IBAction func facebookShare(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            self.presentViewController(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    //Social Media
  
    @IBAction func twitterShare(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            self.presentViewController(tweetShare, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    //timer
    
    
    
    @IBAction func end(sender: AnyObject) {
         timer.invalidate()
             }
    
    
    func update() {
        
        let current = NSDate.timeIntervalSinceReferenceDate()
        
        
        var elapsedTime: NSTimeInterval = current - startTime
        
        
        let minute = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (NSTimeInterval(minute) * 60)
        
        
        let second = UInt8(elapsedTime)
        
        elapsedTime -= NSTimeInterval(second)
        
        
        let fract = UInt8(elapsedTime * 100)
        
        
        let mins = String(format: "%02d", minute)
        let secs = String(format: "%02d", second)
        let frac = String(format: "%02d", fract)
        
        
        timerLabel.text = "\(mins):\(secs):\(frac)"
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
