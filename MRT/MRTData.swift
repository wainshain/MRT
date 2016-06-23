//
//  MRTData.swift
//  MRT
//
//  Created by Roy on 2016/5/5.
//  Copyright © 2016年 123. All rights reserved.
//

import Foundation

import ObjectMapper



struct Line {
    let name: String
    let MRT : [MRTStation]
}


struct MRTStation :Mappable{
    
    var name : String?
    var coordinate : [Float]?
    var lines : [String : String] = [ : ]
    
    
    
    init?(_ map : Map){
    }
    
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        coordinate <- map["coordinate"]
        lines  <- map["lines"]
    }
}

struct MRTResource {
    let MRTByLine : [Line]
    
    init(MRTLine : [String] , stations : [MRTStation]){
        
        var  _lines = [Line]()
        
        for i in 0..<MRTLine.count {
            var station_array = [MRTStation]()
            
            for j in 0..<stations.count{
                
                if (stations[j].lines[MRTLine[i]] != nil){
                    
                    station_array.append(stations[j])
                }
            }
            
            let lines = Line(name: MRTLine[i] , MRT:station_array)
            
            _lines.append(lines)
            
        }
        
        self.MRTByLine = _lines
        
       
        
}

}

func color(lineName:String) -> UIColor {
   
    switch lineName {
    case "文湖線":
        return UIColor(red: 158/255, green: 101/255 , blue: 46/255 , alpha: 1)
        
    case "淡水信義線":
        return UIColor(red: 203/255, green: 44/255 , blue: 48/255 , alpha: 1)
    
    case "新北投支線":
        return UIColor(red: 248/255, green: 144/255 , blue: 165/255 , alpha: 1)
    case "松山新店線":
        return UIColor(red: 0/255, green: 119/255 , blue: 73/255 , alpha: 1)
    case "小碧潭支線":
        return UIColor(red: 206/255, green: 220/255 , blue: 0/255 , alpha: 1)
    case "中和新蘆線":
        return UIColor(red: 255/255, green: 163/255 , blue: 0/255 , alpha: 1)
    case "板南線":
        return UIColor(red: 0/255, green: 94/255 , blue: 184/255 , alpha: 1)
    case "貓空纜車":
        return UIColor(red: 119/255, green: 185/255 , blue: 51/255 , alpha: 1)
        
    default:
        return  UIColor(red: 1, green: 0 , blue: 0 , alpha: 1)
    }
}





