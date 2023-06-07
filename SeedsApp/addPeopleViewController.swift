//
//  addPeopleViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 1/6/23.
//

import UIKit
import RealmSwift


class addPeopleViewController: UIViewController,    UITextFieldDelegate {
    
    @IBOutlet var nameInput: UITextField!
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInput.delegate = self
        
     //   let memo : Memo? = readMemo()
        let people : People? = readPeople()
        
        
    }
    /*
    func readMemo() -> Memo? {
        return realm.objects(Memo.self).first
        
    }
     */
    
    func readPeople() -> People? {
        
        return realm.objects(People.self).first
        
    }
    
    @IBAction func saveWord(){
          
        let personName: String = nameInput.text!
        
        let people : People? = readPeople()
        
            if nameInput.text == "" {
                let alert = UIAlertController(title: "入力してください", message: "入力してください", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                
            }else{
                if people != nil {
                    try! realm.write{
                       
                        let newPerson = People()

                        newPerson.people = personName

                        realm.add(newPerson)
                        
                    }
                }else{

                    let newPerson = People()

                    newPerson.people = personName
                   
                    try! realm.write{
                        realm.add(newPerson)
                        
                    }
                  
                }
            
                let info2 = realm.objects(People.self)
                
                print(info2)
            
                let alert = UIAlertController(title: "保存完了", message: "新しい人の登録が完了しました", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            
            nameInput.text = ""
      
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
