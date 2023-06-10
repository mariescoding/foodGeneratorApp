//
//  generateViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 30/5/23.
//

import UIKit
import RealmSwift

class generateViewController: UIViewController {
    
    @IBOutlet var person1Btn : UIButton!
    @IBOutlet var person2Btn : UIButton!
    @IBOutlet var person3Btn : UIButton!
    
    var peopleHere :[String] = []
    
    var count1: Int = 0
    var count2: Int = 0
    var count3: Int = 0
    
    let realm = try! Realm()
    
    var peopleObj: Results<People>!
    var menuObj: Results<Menu>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get peopleNames from DB
        
        peopleObj = realm.objects(People.self)
        
        // set button texts to peopleNames
        
        person1Btn.setTitle(peopleObj[0].people, for: .normal)
        person2Btn.setTitle(peopleObj[1].people, for: .normal)
        person3Btn.setTitle(peopleObj[2].people, for: .normal)
     
        person1Btn.backgroundColor = UIColor.gray
        person2Btn.backgroundColor = UIColor.gray
        person3Btn.backgroundColor = UIColor.gray
      
    }
    
    @IBAction func personOneClick(){
        
        count1 += 1
        
        if (count1 % 2 == 0){
            person1Btn.backgroundColor = UIColor.gray
            
        }else{
            person1Btn.backgroundColor = UIColor.orange
        }
        
    }
    
    @IBAction func personTwoClick(){
        count2 += 1
        
        if (count2 % 2 == 0){
            person2Btn.backgroundColor = UIColor.gray
            
        }else{
            person2Btn.backgroundColor = UIColor.orange
        }
    
    }
    
    @IBAction func personThreeClick(){
        count3 += 1
        
        if (count3 % 2 == 0){
            person3Btn.backgroundColor = UIColor.gray
       
            
        }else{
            person3Btn.backgroundColor = UIColor.orange
            
        }
   
    }
    
    @IBAction func generateMenu(){
        
        if(count1 % 2 != 0){
            peopleHere.append("1")
        }
        if(count2 % 2 != 0){
            peopleHere.append("2")
        }
        if(count3 % 2 != 0){
            peopleHere.append("3")
        }
        
        print(peopleHere)
        
    //algorithm to decide top 3
        
        // get menus from DB, create menuArray
        
        var menuName : [String] = []
        var avgRate : [String] = []
        
        
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
