//
//  Memo.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 30/5/23.
//

import Foundation
import RealmSwift

class Memo: Object{
    @objc dynamic var personName: String = ""
    
    var personNames = List<People>()

    
}

class People: Object {
    @objc dynamic var people: String = ""
}
