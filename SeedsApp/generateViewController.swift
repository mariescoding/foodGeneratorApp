//
//  generateViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 30/5/23.
//

import UIKit

class generateViewController: UIViewController {
    
    @IBOutlet var person1Btn : UIButton!
    @IBOutlet var person2Btn : UIButton!
    @IBOutlet var person3Btn : UIButton!
    
    var peopleHere :[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get peopleNames from DB
        
        
        
        
        // set button texts to peopleNames
        
        
        
        

     
    }
    
    @IBAction func personOneClick(){
        // color change
        
        person1Btn.isEnabled = true
        
        // add to array;
        peopleHere.append("")
        
    }
    
    @IBAction func personTwoClick(){
        // color change
        
        person1Btn.isEnabled = true
        
        // add to array
        peopleHere.append("")
        
    }
    
    @IBAction func personThreeClick(){
        // color change
        
        person1Btn.isEnabled = true
        
        // add to array
        peopleHere.append("")
        
    }
    
    @IBAction func generateMenu(){
    //algorithm to decide top 3
        
        // get menus from DB, create menuArray
        
        var menuArray: [String] = []
        
        
        
        
        // calcualte avg rate of all menus & push to avgRateArray
        
            // access DB by name
        
        
        
            // if in peopleHere, add to sum
        
        
        
            // calculate average
        
        
        
        // sort the avg & menu arrays ; selection sort
        
        
        
        //get the first three items of menuArray
        
        
        

        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
