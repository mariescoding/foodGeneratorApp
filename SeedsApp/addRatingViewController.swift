//
//  addRatingViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 2/6/23.
//

import UIKit
import RealmSwift

class addRatingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var menuName: UITextField!
    @IBOutlet var rateOne: UITextField!
    @IBOutlet var rateTwo: UITextField!
    @IBOutlet var rateThree: UITextField!
    
    
    @IBOutlet var nameOne: UILabel!
    @IBOutlet var nameTwo: UILabel!
    @IBOutlet var nameThree: UILabel!
    
    let realm = try! Realm()
    
    var menuArray: [String] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuName.delegate = self
        rateOne.delegate = self
        rateTwo.delegate = self
        rateThree.delegate = self
      
        let menu : Menu? = read()
        
        menuName.text = menu?.name
        
        // set people's name label
        
        
        
        

    }
    
    func read() -> Menu? {
        return realm.objects(Menu.self).first
        
    }
    
    
    
    // function for when click on picture button 
    
    @IBAction func choosePic(){
        
        
    }
    
    // add all inputs to database
    
    @IBAction func saveMenu(){
        
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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
