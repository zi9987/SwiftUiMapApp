//
//  Location.swift
//  SwiftUiMapApp
//
//  Created by 羅子淵 on 2024/7/16.
//

import Foundation
import MapKit
struct Location:Identifiable, Equatable{
  
    
    let name:String
    let cityName:String
    let coordinates:CLLocationCoordinate2D
    let description:String
    let imageNames:[String]
    let link:String
    
    
    //Identifiable
    var id:String{
        // name = "colosseum"
        // cityName = "Rome"
        //id = "colosseumRome"
        name + cityName
    }
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }

}
