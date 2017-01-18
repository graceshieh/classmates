//
//  PeopleCell.swift
//  classmates
//
//  Created by Grace Liu on 1/18/17.
//  Copyright © 2017 Grace Shieh. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {
    
    weak var delegate: ShowDetailsDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let delegate2 = delegate {
            delegate2.showButtonPressed(by: self)
        }
        else{
            print("no delegate")
        }
       
    }
    @IBOutlet weak var personImage: UIImageView!
}
