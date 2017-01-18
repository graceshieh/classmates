//
//  ClassmateDelegate.swift
//  classmates
//
//  Created by Grace Liu on 1/18/17.
//  Copyright © 2017 Grace Shieh. All rights reserved.
//

import UIKit

protocol ClassmateDelegate: class {
    
    func cancelButtonPressed(by controller: DetailsViewController)
    
    func saveButtonPressed(by controller: DetailsViewController, newName name: String, newDetails details: String, newImage image: String, at indexPath: NSIndexPath?)
    
//    func showButtonPressed(by controller: PeopleListViewController)
    
    
}
