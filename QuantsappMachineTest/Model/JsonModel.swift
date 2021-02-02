//
//  JsonModel.swift
//  QuantsappMachineTest
//
//  Created by ABHIJIT on 01/02/21.
//

import Foundation
import SwiftyJSON

struct JsonModel {
    var name: String = ""
    var image: String? = ""
    var status: String = ""
    var profilePic: String = ""
    var timeStamp: String = ""
    var url: String? = ""
    
    init() {
    }
    init(json : JSON) {
        name = json["name"].stringValue
        image = json["image"].stringValue
        status = json["status"].stringValue
        profilePic = json["profilePic"].stringValue
        timeStamp = json["timeStamp"].stringValue
        url = json["url"].stringValue
    }
    
}
