//
//  loadViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 13/6/23.
//

import UIKit
import RealmSwift

class loadViewController: UIViewController {
    
    let realm = try! Realm()
    
    var peopleObj: Results<People>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleObj = realm.objects(People.self)
        
        if(peopleObj.isEmpty){
            
            
            
        }else{
            
            
        }

        // Do any additional setup after loading the view.
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
