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
    @IBOutlet var decideBtn : UIButton!
    
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
     
        menu1Btn.backgroundColor = UIColor.systemGray3
        menu2Btn.backgroundColor = UIColor.systemGray3
        menu3Btn.backgroundColor = UIColor.systemGray3
        
        menu1Btn.layer.cornerRadius = 18
        menu2Btn.layer.cornerRadius = 18
        menu3Btn.layer.cornerRadius = 18
        decideBtn.layer.cornerRadius = 30
        
        decideBtn.layer.borderColor = UIColor.black.cgColor
        decideBtn.layer.borderWidth = 5
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuOneClick(){
        
        count1 += 1
        
        if (count1 % 2 == 0){
            menu1Btn.backgroundColor = UIColor.systemGray3
            
        }else{
            menu1Btn.backgroundColor = UIColor.systemOrange
        }
        
    }
    
    @IBAction func menuTwoClick(){
        
        count2 += 1
        
        if (count2 % 2 == 0){
            menu2Btn.backgroundColor = UIColor.systemGray3
            
        }else{
            menu2Btn.backgroundColor = UIColor.systemOrange
        }
    
    }
    
    @IBAction func menuThreeClick(){
        count3 += 1
        
        if (count3 % 2 == 0){
            menu3Btn.backgroundColor = UIColor.systemGray3
       
            
        }else{
            menu3Btn.backgroundColor = UIColor.systemOrange
            
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
        
            // search database for menu, set home's text & image to that menu details
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let homeVC = segue.destination as? home2ViewController{

            let selectNum = index[1]
            
           // let selectedMenu = menuObj[selectNum]
            
            homeVC.nameTemp =
            homeVC.imgTemp =
            
           
        }
      
    }
    
    
}
