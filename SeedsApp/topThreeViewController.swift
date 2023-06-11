//
//  topThreeViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 2/6/23.
//

import UIKit

class topThreeViewController: UIViewController {
    
    @IBOutlet var menu1Btn : UIButton!
    @IBOutlet var menu2Btn : UIButton!
    @IBOutlet var menu3Btn : UIButton!
    
    var count1: Int = 0
    var count2: Int = 0
    var count3: Int = 0
    
    var oneTemp: String!
    var twoTemp: String!
    var threeTemp: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set names of buttons

        menu1Btn.setTitle(oneTemp, for: .normal)
        menu2Btn.setTitle(twoTemp, for: .normal)
        menu3Btn.setTitle(threeTemp, for: .normal)
     
        menu1Btn.backgroundColor = UIColor.gray
        menu2Btn.backgroundColor = UIColor.gray
        menu3Btn.backgroundColor = UIColor.gray
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuOneClick(){
        
        print("1 clciked")
        count1 += 1
        
        if (count1 % 2 == 0){
            menu1Btn.backgroundColor = UIColor.gray
            
        }else{
            menu1Btn.backgroundColor = UIColor.orange
        }
        
    }
    
    @IBAction func menuTwoClick(){
        print("2 clciked")
        count2 += 1
        
        if (count2 % 2 == 0){
            menu2Btn.backgroundColor = UIColor.gray
            
        }else{
            menu2Btn.backgroundColor = UIColor.orange
        }
    
    }
    
    @IBAction func menuThreeClick(){
        count3 += 1
        
        if (count3 % 2 == 0){
            menu3Btn.backgroundColor = UIColor.gray
       
            
        }else{
            menu3Btn.backgroundColor = UIColor.orange
            
        }
   
    }
    
    @IBAction func chooseFinal(){
        
        // check if < 1 button clicked ; if more, give alert/ if one, continue
        
        
        if () {
            
            let alert = UIAlertController(title: "入力してください", message: "入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }else if(){
            
            let alert = UIAlertController(title: "入力してください", message: "入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            
        }else{
            
            
            
            
        }
            
            
        }
        
    
    
        
            // search database for menu, set home's text & image to that menu details
        
        
        
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
