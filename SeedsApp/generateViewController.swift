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
    var menuArray : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get peopleNames from DB
        
        peopleObj = realm.objects(People.self)
        menuObj = realm.objects(Menu.self)
        
        let menuArray = Array(menuObj)
        
        
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
        
        
 
        //get the first three items of menuArray
    
       shuffle()
        
        
        
    }
    
    func shuffle() -> Array<Any> {
        for _ in menuArray {
            let swap1 = Int.random(in: 0..<menuArray.count)
            let swap2 = Int.random(in: 0..<menuArray.count)
            
            menuArray.swapAt(swap1, swap2)
            
        }
        return menuArray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let topThreeVC = segue.destination as? topThreeViewController{
            
            let randomOne = Int.random(in: 0..<menuObj.count)
            let randomTwo = Int.random(in: 0..<menuObj.count)
            let randomThree = Int.random(in: 0..<menuObj.count)
            
            topThreeVC.oneTemp = menuObj[randomOne].name
            
            topThreeVC.twoTemp = menuObj[randomTwo].name
            
            topThreeVC.threeTemp = menuObj[randomThree].name
            
      
        }
      
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
