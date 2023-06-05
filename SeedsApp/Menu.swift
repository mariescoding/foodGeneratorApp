//
//  Menu.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 2/6/23.
//

import Foundation
import RealmSwift

class Menu: Object{
    
    @objc dynamic var name: String = ""
    //@objc dynamic var ing: String = ""
    //@objc dynamic var cuisine: String = ""
    @objc dynamic var picture: String = ""
    
    @objc dynamic var rate1: Int = 0
    @objc dynamic var rate2: Int = 0
    @objc dynamic var rate3: Int = 0
    
}

