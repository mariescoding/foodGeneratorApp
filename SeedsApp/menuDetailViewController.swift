//
//  menuDetailViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 10/6/23.
//

import UIKit
import RealmSwift

class menuDetailViewController: UIViewController {
    
    @IBOutlet var menuName: UILabel!
    @IBOutlet var menuImage: UIImageView!
    @IBOutlet var avgRating: UILabel!
    
    let realm = try! Realm()
    
    var menus: Results<Menu>!
    
    var nameTemp: String!
    var imageTemp: UIImage!
    var rateTemp: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = realm.objects(Menu.self)
        
        menuName.text = nameTemp
        menuImage.image = imageTemp
        avgRating.text = rateTemp
        
        

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
