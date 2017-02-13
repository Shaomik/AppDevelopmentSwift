//
//  Journal.swift
//  FinalProject
//
//  Created by Shaomik Sarkar on 11/14/16.
//  Copyright © 2016 Shaomik Sarkar. All rights reserved.
//

import UIKit
import CoreData

var journals = [NSManagedObject]()


class Journal: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var jTableView: UITableView!
    
       override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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

    
    
    
    
    func tableView(jTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func tableView(jTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.jTableView.dequeueReusableCellWithIdentifier("jcell", forIndexPath: indexPath) as! journalCell
        let jentry = journals[indexPath.row]
        
        
        cell.jTitle.text = (jentry.valueForKey("title") as? String)!
        cell.jDate.text = (jentry.valueForKey("date") as? String)!
        cell.contents = (jentry.valueForKey("content") as? String)!
        cell.images = UIImage(data: (jentry.valueForKey("picname") as? NSData)!)
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let moc = appDelegate.managedObjectContext
            
            moc.deleteObject(journals[indexPath.row])
            appDelegate.saveContext()
            
            journals.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "toStory" {
            if let destination = segue.destinationViewController as? StoryView {
                
                let path = jTableView.indexPathForSelectedRow
                let cell = jTableView.cellForRowAtIndexPath(path!) as! journalCell
                destination.title1 = cell.jTitle.text!
                destination.date1 = cell.jDate.text!
                destination.content1 = cell.contents
                destination.myimage = cell.images
                
            }
            
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRowAtIndexPath(indexPath) {
            self.performSegueWithIdentifier("toStory", sender: navigationController)
        }
        
    }



}
