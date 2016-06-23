//
//  MRTDetailViewController.swift
//  MRT
//
//  Created by Roy on 2016/5/5.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit
//import GoogleMaps

class MRTDetailViewController: UIViewController {
    
    
    var station : MRTStation?

    @IBOutlet weak var stationName: UILabel!
    
    @IBOutlet weak var Label_Line: UILabel!
    
    
    @IBOutlet weak var Line_1: UILabel!
    
    @IBOutlet weak var Line_2: UILabel!
    @IBOutlet weak var Line1_view: UIView!
    
//    @IBOutlet weak var MapView: GMSMapView!

    @IBOutlet weak var Line2_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        stationName.text = station?.name
        var lineNames = [String]()
        for name in (station?.lines.keys)! {
            
            lineNames.append(name)
        }
        
        if (lineNames.count == 1 ) {
            Label_Line.text = lineNames[0]
            Label_Line.backgroundColor = color(lineNames[0])
            Label_Line.textColor = UIColor(white: 1 , alpha: 1)
            Line_1.text = ""
            Line_2.text = ""
            
        }
        
        else {
            Line_1.text = lineNames[0]
            Line1_view.backgroundColor = color(lineNames[0])
            Line_1.textColor = UIColor(white: 1 , alpha: 1)
            Line_2.text = lineNames[1]
            Line2_view.backgroundColor = color(lineNames[1])
            Line_2.textColor = UIColor(white: 1 , alpha: 1)
            Label_Line.text = ""

        }
        //map
//        let camera = GMSCameraPosition.cameraWithLatitude(25.055288,
//                                                          longitude: 121.6175001, zoom: 6)
//       
//        MapView.animateToCameraPosition(camera)
//       MapView.myLocationEnabled = true
//    
//        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(25.055288, 121.6175001)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = MapView
//                
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
