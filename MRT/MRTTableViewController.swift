//
//  MRTTableViewController.swift
//  MRT
//
//  Created by Roy on 2016/5/5.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit
import ObjectMapper

class MRTTableViewController: UITableViewController {
    
    var MRTData : MRTResource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MRT", ofType: "json")!
        let jsonCintent = try! String(contentsOfFile: path)
        let MRTStations : Array<MRTStation> = Mapper<MRTStation>().mapArray(jsonCintent)!
        let Lines = ["淡水信義線","文湖線","新北投支線","松山新店線","小碧潭支線","中和新蘆線","板南線","貓空纜車"]
        
        self.MRTData = MRTResource(MRTLine: Lines , stations: MRTStations)
        
        NSLog(String(MRTData.MRTByLine.count))
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  self.MRTData.MRTByLine.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.MRTData.MRTByLine[section].MRT.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell_1", forIndexPath: indexPath) as! MRTTableViewCell
        let station = self.MRTData.MRTByLine[indexPath.section].MRT[indexPath.row]
        let lineName = MRTData.MRTByLine[indexPath.section].name
        
      
                cell.stationName.text = station.name
        
        if (station.lines.count == 1){
            cell.Line_1.text = station.lines[lineName]
            cell.Line1_back.backgroundColor = color(lineName)
            cell.Line_2.text = ""
            cell.Line_1.textColor = UIColor(white: 1 , alpha: 1)
            cell.Line2_back.backgroundColor = UIColor(white: 1 , alpha: 1)
        }
        
        else {
            var  line_array = [String]()
            
            for name in station.lines.keys {
                line_array.append(name)
            }
            cell.Line_1.text = station.lines[line_array[0]]
            cell.Line1_back.backgroundColor = color(line_array[0])
            cell.Line_2.text = station.lines[line_array[1]]
            cell.Line2_back.backgroundColor = color(line_array[1])
            cell.Line_1.textColor = UIColor(white: 1 , alpha: 1)
            cell.Line_2.textColor = UIColor(white: 1 , alpha: 1)
            
            
        }
        
        
        
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.MRTData.MRTByLine[section].name
    }


    
    
    
    //MARK : - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "ShowDetail"{
            guard let detailViewController = segue.destinationViewController as? MRTDetailViewController else{
                return
            }
            guard let cell = sender as? UITableViewCell else {
                return
            }
            
            let indexPath = self.tableView.indexPathForCell(cell)!
            let station = self.MRTData.MRTByLine[indexPath.section].MRT[indexPath.row]
            detailViewController.station = station
        }
    }
    


}
