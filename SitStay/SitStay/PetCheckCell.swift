//
//  PetCheckCell.swift
//  SitStay
//
//  Created by Philip Gilbreth on 4/21/16.
//  Copyright © 2016 GroupA. All rights reserved.
//

import UIKit

class PetCheckCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    weak var parentController: NewTripOwnerController?
    
    var associatedPet: Pet?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        accessoryType = UITableViewCellAccessoryType.None
    }
    
    func setPTVController(vc: NewTripOwnerController, associatedPet: Pet){
        self.parentController = vc
        self.associatedPet = associatedPet
        label.text = associatedPet.name
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected){
            accessoryType = UITableViewCellAccessoryType.Checkmark
            if let parentController = parentController{
                if let pet = associatedPet{
                    parentController.pets.append(pet)
                }
            }
        } else {
            accessoryType = UITableViewCellAccessoryType.None
            if let parentController = parentController{
                if let pet = associatedPet{
                    if let index = parentController.pets.indexOf(pet){
                        parentController.pets.removeAtIndex(index)
                    }
                }
            }
        }
    }

}
