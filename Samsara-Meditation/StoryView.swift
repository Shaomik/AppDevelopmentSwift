//
//  StoryView.swift
//  team6_finalproject
//
//  Created by Shaomik Sarkar on 11/30/16.
//  Copyright © 2016 Shaomik Sarkar. All rights reserved.
//

import UIKit
import CoreData

class StoryView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "JornalEntry")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            journals = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        titleLabel.text = title1
        dateLabel.text = date1
        contentLabel.text = content1
        image.image = myimage
    }
        
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UITextView!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var title1 = ""
    var date1 = ""
    var content1 = ""
    var myimage = UIImage(named:"dream.jpeg")
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
