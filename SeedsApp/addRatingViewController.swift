//
//  addRatingViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 2/6/23.
//

import UIKit
import RealmSwift

class addRatingViewController: UIViewController, UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var menuName: UITextField!
    @IBOutlet var rateOne: UITextField!
    @IBOutlet var rateTwo: UITextField!
    @IBOutlet var rateThree: UITextField!
    
    @IBOutlet var nameOne: UILabel!
    @IBOutlet var nameTwo: UILabel!
    @IBOutlet var nameThree: UILabel!
    
    @IBOutlet var photoImageView: UIImageView!
    
    let realm = try! Realm()
    var objects: Results<People>!
    
    // ドキュメントディレクトリの「ファイルURL」（URL型）定義
       var documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

       // ドキュメントディレクトリの「パス」（String型）定義
       let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
      

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuName.delegate = self
        rateOne.delegate = self
        rateTwo.delegate = self
        rateThree.delegate = self
      
        let menu : Menu? = read()
        
        objects = realm.objects(People.self)
        
        nameOne.text = objects[0].people
        
        nameTwo.text = objects[1].people
        
        nameThree.text = objects[2].people
    
        
    

    }
    
    func read() -> Menu? {
        return realm.objects(Menu.self).first
        
    }
    
    // function for when click on picture button
    
    func createLocalDataFile() {
            // 作成するテキストファイルの名前
            let fileName = "\(NSUUID().uuidString).png"

            // DocumentディレクトリのfileURLを取得
            if documentDirectoryFileURL != nil {
                // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
                let path = documentDirectoryFileURL.appendingPathComponent(fileName)
                documentDirectoryFileURL = path
            }
        }
        
        //画像を保存する関数の部分
        func saveImage() {
            createLocalDataFile()
            //pngで保存する場合
            let pngImageData = photoImageView.image?.pngData()
            do {
                try pngImageData!.write(to: documentDirectoryFileURL)
            } catch {
                //エラー処理
                print("エラー")
            }
        }
    

    func presentPickerController(sourceType: UIImagePickerController.SourceType){
           if UIImagePickerController.isSourceTypeAvailable(sourceType){
               let picker = UIImagePickerController()
               picker.sourceType = sourceType
               picker.delegate = self
               self.present(picker, animated: true, completion: nil)
           }
       }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            self.dismiss(animated: true, completion: nil)
        //print("picture place: ", info[.originalImage])
        photoImageView.image = info[.originalImage] as? UIImage
            
        }
       
       
    
    @IBAction func choosePic(){
    
        presentPickerController(sourceType: .photoLibrary)
        
    }
        
    
    @IBAction func saveMenu(){
        
        let menuNameTemp: String = menuName.text!
        let ratingOne: String = rateOne.text!
        let ratingTwo: String = rateTwo.text!
        let ratingThree: String = rateThree.text!
        
        let menu : Menu? = read()
        
        if menuName.text == "" || rateOne.text == "" || rateTwo.text == "" || rateThree.text == "" {
            let alert = UIAlertController(title: "入力してください", message: "入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }else{
          
            if menu != nil {
                try! realm.write{
                    let newMenu = Menu()
                    
                    newMenu.name = menuNameTemp
                    newMenu.rate1 = Int(ratingOne) ?? 0
                    newMenu.rate2 = Int(ratingTwo) ?? 0
                    newMenu.rate3 = Int(ratingThree) ?? 0
                    newMenu.picture = documentDirectoryFileURL.absoluteString
                    realm.add(newMenu)
                    
                }
            }else{
                let newMenu = Menu()
                newMenu.name = menuNameTemp
                newMenu.rate1 = Int(ratingOne) ?? 0
                newMenu.rate2 = Int(ratingTwo) ?? 0
                newMenu.rate3 = Int(ratingThree) ?? 0
                
                
                try! realm.write{
                    realm.add(newMenu)

                }
              
            }
            
            let info = realm.objects(Menu.self)
      
            print(info)
            
            let alert = UIAlertController(title: "保存完了", message:  "新しいメニューの登録が完了しました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
       
        
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
