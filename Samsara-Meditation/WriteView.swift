//
//  WriteView.swift
//  team6_finalproject
//
//  Created by Shaomik Sarkar on 11/30/16.
//  Copyright © 2016 Shaomik Sarkar. All rights reserved.
//  source citation: https://www.youtube.com/watch?v=1kCKlv1npw0

import UIKit
import CoreData

class WriteView: UIViewController, UIImagePickerControllerDelegate,NSFetchedResultsControllerDelegate, UINavigationControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveInfo(sender: AnyObject) {
        saveEntry(titleLbl.text!, date: dateLbl.text!, content: contentLbl.text, pic: UIImagePNGRepresentation(imageLbl.image!)! )
    }
    
    // camera functionality
    
//    @IBAction func addImage(sender: AnyObject) {
//        let pickerController = UIImagePickerController()
//        pickerController.delegate = self
//        pickerController.sourceType = UIImagePickerControllerSourceType.Camera
//        pickerController.allowsEditing = true
//        
//        self.presentViewController(pickerController, animated: true, completion: nil)
//        
//    }
//    
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
//        
//        self.dismissViewControllerAnimated(true, completion: nil)
//        
//        self.imageLbl.image = image
//    }

    @IBOutlet weak var titleLbl: UITextField!
    
    @IBOutlet weak var dateLbl: UITextField!
    
    @IBOutlet weak var imageLbl: UIImageView!

    @IBOutlet weak var contentLbl: UITextView!
    
    func saveEntry (title: String, date: String, content: String, pic: NSData) {
        
            
            let appDelegate =
                UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            let entity =  NSEntityDescription.entityForName("JornalEntry",
                                                            inManagedObjectContext:managedContext)
            
            let entry = NSManagedObject(entity: entity!,
                                      insertIntoManagedObjectContext: managedContext)
        
        
            
            entry.setValue(title, forKey: "title")
            entry.setValue(date, forKey: "date")
            entry.setValue(content, forKey: "content")
            entry.setValue(pic, forKey: "picname")
        


            
            
            do {
                try managedContext.save()
                journals.append(entry)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "JornalEntry")
        
        //3
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            journals = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
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

}
