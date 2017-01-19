//
//  DetailsViewController.swift
//  classmates
//
//  Created by Grace Liu on 1/18/17.
//  Copyright © 2017 Grace Shieh. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController {
    weak var delegate : ClassmateDelegate?
    var indexPath: NSIndexPath?
    var classmate: Classmate? 
    
//    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var nameInputText: UITextField!
    @IBOutlet weak var detailsInputText: UITextField!
    @IBOutlet weak var personImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imagePicker.delegate = self
        if let ip = indexPath {
            nameInputText.text = classmate?.name
            detailsInputText.text = classmate?.details
//            personImage.image = UIImage(image)
        }
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.saveButtonPressed(by: self, newName: nameInputText.text!, newDetails: detailsInputText.text!, newImage: "Chameleon", at: indexPath, updated: classmate)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self )
    }
    
    
    @IBAction func newImageButtonPressed(_ sender: UIButton) {
//        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = .photoLibrary
//        
//        present(imagePicker, animated: true, completion: nil)
        
    }
}
