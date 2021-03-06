//
//  Sitter_Pets.swift
//  Sitter_PetTab
//
//  Created by MU IT Program on 3/30/16.
//  Copyright © 2016 Megan Cochran. All rights reserved.
//

import UIKit

class PetsSitter: UIViewController {
    
    let reuseIdentifier = "cell"
    var noPetsReuseIdentifier = "noPets"
    
    @IBOutlet var petCollection: UICollectionView!
    
    
    
    var pets: [String] = []
    var petSpecies: [String] = []
    var petIDs: [String] = []
    //"Pet 1", "Pet 2", "Pet 3", "Pet 4", "Pet 5", "Pet 6"
    
    var tripNames: [String] = []
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
         
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        pets.removeAll()
        print(pets)
        petSpecies.removeAll()
        tripNames.removeAll()
        petIDs.removeAll()
       
        if let fetchedTrips = appDelegate.getTrips(){
            for trip in fetchedTrips{
                if(trip.isSitting!.boolValue == true){
                    tripNames.append(trip.tripName!)
                    print("testing trip id 1")
                    print(trip.tripID)
                   
                }
                if let fetchedPets = appDelegate.getPets(){
                    for pet in fetchedPets{
                        if(pet.isSat?.boolValue == true){
                            pets.append(pet.name!)
                            petSpecies.append(pet.species!)
                            petIDs.append(pet.petID!.stringValue)
                        }
                    }
                }
            }
        }
        
        //if(tripNames.count > 0){
        
        //}
        
        print(pets)
        self.petCollection.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        
        return 1
    }
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(pets.count == 0){
        return 1
    } else {
        return self.pets.count
        }
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if(pets.count == 0){
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(noPetsReuseIdentifier, forIndexPath: indexPath)
            
            
            
            return cell
        }
        else{
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CellSitter
            
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.petName.text = self.pets[indexPath.item] as? String
            cell.petButton.setTitle(self.petIDs[indexPath.item], forState: .Normal)
            cell.petImage.image = self.appDelegate.pickPetPicture(self.petSpecies[indexPath.item])
            
        
            let newSwiftColor = UIColor(red: 238, green: 255, blue: 247, alpha: 0.0)
            cell.backgroundColor = newSwiftColor
            // make cell more visible in our example project
            //cell.layer.borderWidth = 1
            //cell.layer.cornerRadius = 20
            return cell
        }

    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if(pets.count == 0){
            
            //let deviceSize = UIScreen.mainScreen().bounds.size
            //let cellSize = sqrt(Double(deviceSize.width * deviceSize.height) / (Double(33)))
            
            let cellWidth = 500
            let cellHeight = 200
            
            return CGSize(width: cellWidth , height: cellHeight)}
        else {
            
            // let deviceSize = UIScreen.mainScreen().bounds.size
            //let cellSize = sqrt(Double(deviceSize.width * deviceSize.height) / (Double(33)))
            
            let cellWidth = 100
            let cellHeight = 150
            
            return CGSize(width: cellWidth , height: cellHeight)
        }
    }
    
    
    /*func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: "footer", forIndexPath: indexPath)
        // configure footer view
        return view
    }*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "toPet"){
            let viewController = segue.destinationViewController as! PetInfoSitter
            if let buttonTitle = (sender as? UIButton)?.titleLabel?.text{
                let intTitle = Int(buttonTitle)
                viewController.petID = intTitle
            }}
    }

    /*func collectionView(collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String,atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            let headerView =
                collectionView.dequeueReusableSupplementaryViewOfKind(kind,withReuseIdentifier: "header",forIndexPath: indexPath)as! supplementaryView
            headerView.label.text = ""
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }*/
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
       
}
