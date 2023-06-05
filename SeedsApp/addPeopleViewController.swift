//
//  addPeopleViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 1/6/23.
//

import UIKit
import RealmSwift

struct GlobalVariables {
    static var peopleArray: [String] = []
}

class addPeopleViewController: UIViewController,    UITextFieldDelegate {
    
    // Get value
    
    var peopleArray = GlobalVariables.peopleArray
  
    
    @IBOutlet var nameInput: UITextField!
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInput.delegate = self
        
        let memo : Memo? = readMemo()
        let people : People? = readPeople()
        
        nameInput.text = memo?.personName
        
        //print(peopleArray)

        // Do any additional setup after loading the view.
    }
    
    func readMemo() -> Memo? {
        return realm.objects(Memo.self).first
        
    }
    
    func readPeople() -> People? {
        return realm.objects(People.self).first
        
    }
    
    @IBAction func saveWord(){
          
        var personName: String = nameInput.text!
        let memo : Memo? = readMemo()
        let people : People? = readPeople()
        
            if nameInput.text == "" {
                let alert = UIAlertController(title: "入力してください", message: "入力してください", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                
            }else{
              //  peopleArray.append(personName)
                //save to DB
                
                print(personName)
                //let p = people!.people(value: personName)
                
                
                if memo != nil {
                    try! realm.write{
                        //memo!.personNames.append(People(value: personName))
                        let newPerson = People()
                        let newMemo = Memo()

                        newPerson.people = personName

                        newMemo.personNames.append(newPerson)
                        realm.add(newMemo)
                        
                        print("success! 1 ")
                    }
                }else{
                    let newMemo = Memo()
                    //newMemo.personNames.append(People(value: personName))
                    
                    let newPerson = People()

                    newPerson.people = personName

                    newMemo.personNames.append(newPerson)
                    
                    try! realm.write{
                        realm.add(newMemo)
                        
                        print("success 2")
                    }
                  
                }
            
                let info = realm.objects(Memo.self)
                
                let info2 = realm.objects(People.self)
               
                
                print(info)
                print(info2)
                //print(name)
                
                let alert = UIAlertController(title: "保存完了", message: "新しい人の登録が完了しました", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            
            
            nameInput.text = ""
       // print(peopleArray)
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
