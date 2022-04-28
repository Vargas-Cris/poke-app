//
//  Poke+String.swift
//  ProjectMVVM
//
//  Created by MAC21 on 27/04/22.
//

import Foundation
class HelperString{
    static func getIdFromUrl(url: String)-> String{
        
        return url.components(separatedBy: "/").filter({$0 != ""}).last!
        
    }
}
