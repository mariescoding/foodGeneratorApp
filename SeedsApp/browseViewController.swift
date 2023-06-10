//
//  browseViewController.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 30/5/23.
//

import UIKit
import RealmSwift

class browseViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let realm = try! Realm()
    
    @IBOutlet var collectionView: UICollectionView!
    
    var peopleObj: Results<People>!
    var menuObj: Results<Menu>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        collectionView.delegate = self
        collectionView.dataSource = self
        
        menuObj = realm.objects(Menu.self)
        
        collectionView.register(UINib(nibName: "browseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
                
            collectionView.reloadData()
            }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // add the code here to perform action on the cell
        let cell = collectionView.cellForItem(at: indexPath)
        performSegue(withIdentifier: "menuDetail", sender: indexPath)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailsVC = segue.destination as! menuDetailViewController
       
        let index = sender as! IndexPath
        let selectNum = index[1]
        
        let selectedMenu = menuObj[selectNum]
        
        detailsVC.nameTemp = selectedMenu.name
        
        let sum = (selectedMenu.rate1) + (selectedMenu.rate2) + (selectedMenu.rate3)
        let avg = sum / 3
        
        detailsVC.rateTemp = String(avg)
        
        //detailsVC.imageTemp =
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuObj.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! browseCollectionViewCell
    
        
        let object = menuObj[indexPath.row]
        
        cell.menuName.text = object.name
        
    
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // 横方向のスペース調整
        let horizontalSpace:CGFloat = 4

        //セルのサイズを指定。画面上にセルを3つ表示させたいのであれば、デバイスの横幅を3分割した横幅　- セル間のスペース*2（セル間のスペースが二つあるため）
       let cellSize:CGFloat = self.view.bounds.width/3 - horizontalSpace*2
     
        
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
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
