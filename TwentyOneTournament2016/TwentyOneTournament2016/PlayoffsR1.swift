//
//  PlayoffsR1.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/25/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation


class PlayoffsR1: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    let cellId = "round1Cell"
    
    let seeds = [9,8,12,5,10,7,11,6]
    
    var teams = []
    
    var matches = []
    
    override func viewDidLoad() {
                //Get standings
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            print("Getting Standings...")
            self.teams = ParseOps.sharedOps().getStandings()
            dispatch_async(dispatch_get_main_queue(), {
                //Do everthing you need to do with the Parse Objects in this area.
                
                // Register custom cell
                var nib = UINib(nibName: "R1PlayoffCell", bundle: nil)
                self.tableView.registerNib(nib, forCellReuseIdentifier: self.cellId)
                
                self.tableView.delegate = self
                self.tableView.dataSource = self
                
                self.tableView.rowHeight = 130
                
                self.tableView.contentOffset = CGPoint(x:0, y:0)
                
                self.tableView.reloadData()
                
            })
        })
        
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: r1Cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! r1Cell
        
        let row = indexPath.row
        
        if row == 0{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        } else if row == 1{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        } else if row == 2{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        } else if row == 3{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        }
        
        
        cell.seed1.text = "\(matches[row].seed1!)"
        cell.seed2.text = "\(matches[row].seed2!)"
        
        if (matches[row].winner! == 1){
            cell.team1Btn.tintColor = UIColor.greenColor()
            cell.team2Btn.tintColor = UIColor.redColor()
        }
        else if (matches[row].winner! == 2){
            cell.team2Btn.tintColor = UIColor.greenColor()
            cell.team1Btn.tintColor = UIColor.redColor()
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print("Row: \(row+1)")
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let svc = segue.destinationViewController as! PlayoffsR2;
//        
//        svc.scrollPosition = tableView.contentOffset
//        print(tableView.contentOffset)
//        
//        
//    }
    
}