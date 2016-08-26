//
//  FoodCourseViewController.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/25.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class FoodCourseViewController: BaseViewController {

    
    
    var serialId: String?
    
    
    private var tbView: UITableView?
    
    
    
    private var serialModel: FoodCourseModel?
    
    
    private var serialIndex: Int = 0
    
    
    private var serialisExpand: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(serialId)
        
        
        
        createMyNav()
        
        downloadFoodCourseData()
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    
    
    
    func downloadFoodCourseData(){
    
        
        
        if serialId == nil{
        
            return
        
        }
        
        
        
        
        
//        methodName=CourseSeriesView
        
        var dict = Dictionary<String,String>()
        
        dict["methodName"] = "CourseSeriesView"
        
        dict["series_id"] = serialId!
        
        let downloader = KTCDownloader()
        
        downloader.delegate = self
        
        downloader.type = .FoodCourse
        
        downloader.postWithUrl(kHostUrl, paras: dict)
        
        
    
    
    
    
    }
    
    
    
    
    
    
    func createMyNav(){
    
    
        addNavBackBtn()
    
        createTableView()
        
    
    
    
    }
    
    
    
    func createTableView(){
    
    
        self.automaticallyAdjustsScrollViewInsets = false
        tbView = UITableView(frame: CGRectMake(0, 64, kScreenWidth, kScreenHeight-64), style: .Plain)
        
        
        tbView?.separatorStyle = .None
        tbView?.delegate = self
        tbView?.dataSource = self
        view.addSubview(tbView!)
        
    
    
    
    
    
    
    
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




extension FoodCourseViewController: UITableViewDelegate, UITableViewDataSource {

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        
        if section == 0{
        
            
            if serialModel?.data?.data?.count > 0 {
            
            
                rowNum = 3
            
            
            }
            
            
            
        
        
        
        }else if section == 1{
        
        
        
        
        
        }
        
        
        
        
        
        return rowNum
    }

    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        
        if indexPath.section == 0{
        
            if indexPath.row == 0{
            
                height = 160
            
            }else if indexPath.row == 1{
            
                if serialModel?.data?.data?.count > 0{
            
                let model = serialModel?.data?.data![serialIndex]
                height = FCCourceCell.heightWithModel(model!)
                    
                }
            
            
            }else if indexPath.row == 2 {
            
            
                
                
                height = FCSerialCell.heightWithNum((serialModel?.data?.data?.count)!, isExpand: serialisExpand)
                
            
            }
            
            
        }else if indexPath.section == 1{
        
        
        
            
        
        
        
        
        }
        
        
        
        
        
        
    
        return height
    }
    
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0{
            
            
             let dataModel = serialModel?.data?.data![serialIndex]
            if indexPath.row == 0{
                
               
                cell = createVideoCellForTableView(tableView, atIndexPath: indexPath, withModel: dataModel!)
                
                
                
                
            }else if indexPath.row == 1{
            
                
              
                
                cell = createCourceCellForTableView(tableView, atIndexPath: indexPath, withModel: dataModel!)
            
            
            
            
            }else if indexPath.row == 2 {
            
            
            
                cell = createSerialCellForTableView(tableView, atIndexPath: indexPath, withModel: serialModel!)
            
            
            
            
                
            
            
            }
            
        }else if indexPath.section == 1{
        
        
        
        
        
        
        
        
        
        
        
        }
        
        
        cell.selectionStyle = .None
        
        
        return cell
    }
    
    
    
    func createSerialCellForTableView(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withModel model: FoodCourseModel) -> FCSerialCell {
    
    
        let cellId = "serailCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FCSerialCell
        
        if nil == cell {
        
        
            cell = FCSerialCell(style: .Default, reuseIdentifier: cellId)
        
        }
        
        
        cell?.delegate = self
        cell?.isExpand = serialisExpand
        
        cell?.number = model.data?.data?.count
        
        cell?.selectIndex = serialIndex
        
        
        
        
        cell?.backgroundColor = UIColor.redColor()
        
        return cell!
        
        
    
    }
    
    
    
    
    
    func createVideoCellForTableView(tableView: UITableView, atIndexPath: NSIndexPath, withModel model: FoodCourseSerialModel) -> FCVideoCell {
        
            let cellId = "videoCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FCVideoCell
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("FCVideoCell", owner: nil, options: nil).last as? FCVideoCell
            }
            
        
            cell?.model = model
            
            cell?.videoClosure = {
                
                [weak self]
                urlString in
                
                let url = NSURL(string: urlString)
                let player = AVPlayer(URL: url!)
                
                
                let playerCtrl = AVPlayerViewController()
                
                playerCtrl.player = player
                
                player.play()
                
                self?.presentViewController(playerCtrl, animated: true, completion: nil)
                
                
                
                
                
            }
            
            return cell!

            
        
    
    
    
    }
    
    
    
    
    func createCourceCellForTableView(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withModel model: FoodCourseSerialModel ) -> FCCourceCell {
    
        
        let cellId = "courseCellId"
    
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FCCourceCell
        
        if nil == cell {
        
        
        
            cell = NSBundle.mainBundle().loadNibNamed("FCCourceCell", owner: nil, options: nil).last as? FCCourceCell
        
        
        }
        
        
    
        cell?.model = model
        
        
    
    
        return cell!
    
    }
    
    
    
    
    
}



extension FoodCourseViewController: KTCDownloadDelegate{

    
    
    
    
    
    
    
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        
        print(error.description)
        
        
    }

    
    
    
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if downloader.type == KTCDownloaderType.FoodCourse {
        
            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)
            
            print(str!)
            
            if let jsonData = data{
            
                let model = FoodCourseModel.parseModelWithData(jsonData)
                print(model)
                
                
                
                serialModel = model
                
                
                dispatch_async(dispatch_get_main_queue() , {
                    
                
                    [weak self] in
                
                    self!.tbView?.reloadData()
                    
                
                
                
                
                })
                
                
                
            
            }
            
        
        
        }else if downloader.type == .FoodCourseComment{
        
            
        
        }
        
        
    }
}





extension FoodCourseViewController: FCSerialCellDelegate {

    
    

    func didSelectSerialAtIndex(index: Int) {
        
        
        
        serialIndex = index
        
        
        
        
        tbView?.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
        
        
        
        
        
    }
    
    
    
    func changeExpandState(isExpand: Bool) {
        
        
        serialisExpand = isExpand
        
        
        tbView?.reloadRowsAtIndexPaths([NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: .Automatic)
        
        
        
        
    }
    
    
    
    
    
    
    
    


}