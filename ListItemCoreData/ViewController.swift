//
//  ViewController.swift
//  ListItemCoreData
//
//  Created by Admin on 06/09/2017.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit
import CoreData

class tableViewController: UITableViewController{

    var listItems = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create add Button
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: Selector("addItem"))
        
        
    }

    
    func addItem()
    {
        
        let alertController = UIAlertController(title: "Type something", message: "add ", preferredStyle: UIAlertControllerStyle.alert)
        
        let confirmAction  = UIAlertAction(title: "type something", style: UIAlertActionStyle.default, handler: ({
            (_) in
            
            
        }))
        
    }
    
    func saveItem(itemToSave: String)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        do {
            try managedContext.save()
            listItems.append(item)
            
        } catch  {
            print("error")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! UITableViewCell
        
        return cell
    }
    
}

