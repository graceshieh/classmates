//
//  ViewController.swift
//  classmates
//
//  Created by Grace Liu on 1/18/17.
//  Copyright © 2017 Grace Shieh. All rights reserved.
//

import CoreData
import UIKit

class PeopleListViewController: UITableViewController, ClassmateDelegate, ShowDetailsDelegate {
    
    var people = [Classmate]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
//        let newPerson = NSEntityDescription.insertNewObject(forEntityName: "Classmate", into: managedObjectContext) as! Classmate
//        newPerson.name = "June"
//        newPerson.details = "Loves Tamacat"
//        newPerson.image = "Chameleon"
//        
//        if managedObjectContext.hasChanges {
//            do{
//                try managedObjectContext.save()
//            }
//            catch {
//                print("\(error)")
//            }
//        }
        
        let peopleRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Classmate")
        do {
            let results = try managedObjectContext.fetch(peopleRequest)
            people = results as! [Classmate]
        }
        catch{
            print("\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell") as! PeopleCell
        cell.nameLabel.text = people[indexPath.row].name
        cell.delegate = self
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PeopleDetails" {
            
            if let senderObj = sender as? UITableViewCell {
                let navigationController = segue.destination as! UINavigationController
                let myController = navigationController.topViewController as! DetailsViewController
                myController.delegate1 = self
                var indexPath = tableView.indexPath(for: senderObj as UITableViewCell)
                myController.classmate = people[(indexPath?.row)!]
                myController.indexPath = indexPath as NSIndexPath?
            }
            else{
                let navigationController = segue.destination as! UINavigationController
                let myController = navigationController.topViewController as! DetailsViewController
                myController.delegate1 = self
            }
      
            
        }
    }
    
    func cancelButtonPressed(by controller: DetailsViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func showButtonPressed(by cell: PeopleCell){
        
        performSegue(withIdentifier: "PeopleDetails", sender: cell)
        
    }

    func saveButtonPressed(by controller: DetailsViewController, newName name: String, newDetails details: String, newImage image: String, at indexPath: NSIndexPath?, updated: Classmate?) {
        if let updatedClassmate = updated{
            updatedClassmate.name = name
            updatedClassmate.details = details
            updatedClassmate.image = image
        }
        else{
            let newClassmate = NSEntityDescription.insertNewObject(forEntityName: "Classmate", into: managedObjectContext) as! Classmate
            newClassmate.name = name
            newClassmate.details = details
            newClassmate.image = image
        }
        if managedObjectContext.hasChanges {
            do{
                try managedObjectContext.save()
            }
            catch {
                print("\(error)")
            }
        }
        let peopleRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Classmate")
        do {
            let results = try managedObjectContext.fetch(peopleRequest)
            people = results as! [Classmate]
        }
        catch{
            print("\(error)")
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let personToDelete = people[indexPath.row]
        managedObjectContext.delete(personToDelete)
        if managedObjectContext.hasChanges {
            do{
                try managedObjectContext.save()
            }
            catch {
                print("\(error)")
            }
        }
        people.remove(at: indexPath.row)
        tableView.reloadData()
    }

}

