//
//  topThreeViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 2/6/23.
//

import UIKit
import RealmSwift

class topThreeViewController: UIViewController {

    let realm = try! Realm()
    
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
    
    var menu1P : Int!
    var menu2P : Int!
    var menu3P : Int!
    
    var selectMenu : Int!
    
    var menusClicked :[String] = []
    var menuObj: Results<Menu>!
    

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
        
        menuObj = realm.objects(Menu.self)
        
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
        
        menusClicked.removeAll()
        
        if(count1 % 2 != 0){
            menusClicked.append("1")
            selectMenu = menu1P
            
        }
        if(count2 % 2 != 0){
            menusClicked.append("2")
            selectMenu = menu2P
            
        }
        if(count3 % 2 != 0){
            menusClicked.append("3")
            selectMenu = menu3P
            
        }
        
        print(menusClicked)
        
        // if none is picked
        if (menusClicked.count == 0) {
            
            let alert = UIAlertController(title: "どれかを選択してください！", message: "入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
        // if more than 1 is picked
        else if(menusClicked.count > 1){
            
            let alert = UIAlertController(title: "一つだけを選んでください！", message: "入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            
        }else{
            
            print("can go to home page !!")
            
           
            
        }
        
            // search database for menu, set home's text & image to that menu details
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let homeVC = segue.destination as? home2ViewController{
            
        let selectedMenu = menuObj[selectMenu]
            
            homeVC.nameTemp =  selectedMenu.name
            
            //URL型にキャスト
            let fileURL = URL(string: selectedMenu.picture)
            
            //パス型に変換
            let filePath = fileURL?.path
           
            
            homeVC.imgTemp = UIImage(contentsOfFile: filePath!)
          
            
           
        }
      
    }
    
    
}
