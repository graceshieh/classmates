//
//  DetailsViewController.swift
//  classmates
//
//  Created by Grace Liu on 1/18/17.
//  Copyright © 2017 Grace Shieh. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var delegate1 : ClassmateDelegate?
    var indexPath: NSIndexPath?
    var classmate: Classmate? 
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var nameInputText: UITextField!
    @IBOutlet weak var detailsInputText: UITextField!
    @IBOutlet weak var personImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        if let ip = indexPath {
            nameInputText.text = classmate?.name
            detailsInputText.text = classmate?.details
//            personImage.image = UIImage(image)
        }
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        delegate1?.saveButtonPressed(by: self, newName: nameInputText.text!, newDetails: detailsInputText.text!, newImage: "Chameleon", at: indexPath, updated: classmate)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate1?.cancelButtonPressed(by: self )
    }
    
    
    @IBAction func newImageButtonPressed(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage]
        personImage.contentMode = .scaleAspectFit
        personImage.image = chosenImage as! UIImage?
        dismiss(animated: true, completion: nil)
    }
    
}
