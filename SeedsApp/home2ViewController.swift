//
//  home2ViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 4/6/23.
//

import UIKit

class home2ViewController: UIViewController {
    
    @IBOutlet var menuName : UILabel!
    @IBOutlet var menuImg: UIImageView!
    
    var nameTemp: String!
    var imgTemp: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuName.text = nameTemp
        menuImg.image = imgTemp
        
        

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
