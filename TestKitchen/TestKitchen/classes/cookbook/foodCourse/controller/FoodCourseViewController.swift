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
    
    private var curPage = 1
    
    
    private var commentModel: FCComment?
    
    
    private var infoLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(serialId)
        
        
        
        createMyNav()
        
        downloadFoodCourseData()
        
        downloadCommentData()
        
        
        
        

        // Do any additional setup after loading the view.
    }
   
    func downloadCommentData(){
    
        
        var params = Dictionary<String,String>()
        
        params["methodName"] = "CommentList"
        params["page"] = "\(curPage)"
        
        params["relate_id"] = serialId
        params["size"] = "10"
        
        params["type"] = "2"
        let donwloaderDeng = KTCDownloader()
        
        donwloaderDeng.type = KTCDownloaderType.FoodCourseComment
        donwloaderDeng.delegate = self
        
        donwloaderDeng.postWithUrl(kHostUrl, paras: params)
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
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
        
        
            
                if commentModel?.data?.data?.count>0{
            
            
                    rowNum = (commentModel?.data?.data?.count)!
                
                
                }
                
            
        
        
        
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
        
        
        
            height = 80
            
        
        
        
        
        }
        
        
        
        
        
        
    
        return height
    }
    
    
    
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 1{
            
            
                let bgView = UIView.createView()
            
            
                bgView.frame = CGRectMake(0, 0, kScreenWidth, 60)
            
            
                bgView.backgroundColor = UIColor.whiteColor()
            
            
            
            if commentModel?.data?.total != nil {
            
                let str = "\((commentModel?.data?.total)!)条评论"
            
            
                let numLabel = UILabel.createLabel(str, font: UIFont.systemFontOfSize(17), textAligment: .Center, textColor: UIColor.grayColor())
                
                
                numLabel.frame = CGRectMake(20, 4, 160, 20)
                
                
                bgView.addSubview(numLabel)
            
            
            
            }
            
            
            
            
            let btn = UIButton.createBtn("我要评论", bgImageName: nil, selectBgImageName: nil, target: self, action: nil)
            
            
            
        
            bgView.addSubview(btn)
            btn.frame = CGRectMake(20, 34, kScreenWidth - 20*2, 30)
            btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            btn.backgroundColor = UIColor.orangeColor()
            
            btn.layer.cornerRadius = 6
            
            
            btn.layer.masksToBounds = true
            
            bgView.addSubview(btn)
        
            
            
            
            
            
            
            
            
                return bgView
            
            
            
            
        }
        
        
        
        return UIView()
        
    }
    
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1{
        return 70
        }
        
        
        return 0
        
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
        
        
            
            let detailModel = commentModel?.data?.data![indexPath.row]
        
            cell = createCommentCellForTableView(tableView, atIndexPath: indexPath, withModel: detailModel!)
        
        
        
        
        
        
        
        
        }
        
        
        cell.selectionStyle = .None
        
        
        return cell
    }
    
    
    
    func createCommentCellForTableView(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withModel detailModel: FCCommentDetail) -> FCCommentCell{
    
        let cellId = "commentCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FCCommentCell
        
        if nil == cell {
        
        
            cell = NSBundle.mainBundle().loadNibNamed("FCCommentCell", owner: nil, options: nil).last as? FCCommentCell
        
        }
    
    
    
        cell?.model = detailModel
        
        
        
    
        return cell!
    
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
            
            if let jsonData = data {
                  let model = FoodCourseModel.parseModelWithData(jsonData)
                serialModel = model

                                dispatch_async(dispatch_get_main_queue(), {
                                    [weak self] in
                //                    self?.tbView?.reloadSections(NSIndexSet(index: 1), withRowAnimation: .None)
                                    self!.tbView!.reloadData()
                                    
                                    
                                    let array = self!.serialModel?.data?.series_name?.componentsSeparatedByString("#")
                                    
                                    
                                    if array?.count > 1{
                                    
                                    
                                        self!.addNavTitle(array![1])
                                    
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                })
                
                

            }
            
        }else if downloader.type == .FoodCourseComment{
                //
            
            
            
            
            
            
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)
//            print(str!)
            if let jsonData = data{
                let model = FCComment.parseWithData(jsonData)
//                print(model)
                if curPage == 1{
                    commentModel = model
                }else{
                    let mutableArray = NSMutableArray(array: (commentModel?.data?.data)!)
                    mutableArray.addObjectsFromArray((model.data?.data)!)
                    let array = NSArray(array: mutableArray)
                    commentModel?.data?.data = array as? [FCCommentDetail]
                }
//                serialModel = model
//                let array = serialModel?.data?.series_name?.componentsSeparatedByString("#")
                dispatch_async(dispatch_get_main_queue() , {
                    [weak self] in
                    var hasMore = false
                    if self!.commentModel?.data?.total != nil {
//                        let hasMore = false
                        let total = NSString(string: (self?.commentModel?.data?.total)!).integerValue
                        if total > self!.commentModel?.data?.data?.count{
                            hasMore = true
                        }
                    }
                    if self!.infoLabel == nil {
                        self!.infoLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(16), textAligment: .Center, textColor: UIColor.blackColor())
                        self!.infoLabel!.frame = CGRectMake(0, 0, kScreenWidth, 40)
                        self!.infoLabel?.backgroundColor = UIColor.init(white: 0.8, alpha: 1.0)
                        self!.tbView?.tableFooterView = self!.infoLabel
                    }
                    if hasMore {
                        self!.infoLabel?.text = "下拉加载更多"
                    }else{
                        self?.infoLabel?.text = "没有更多了！"
                    }
//                    if array?.count > 1{
//                        self!.addNavTitle(array![1])
//                    }
                self!.tbView?.reloadData()
                })
            }
//        }else if downloader.type == .FoodCourseComment{
//            if let jsonData = data {
//                commentModel = FCComment.parseWithData(jsonData)
//                dispatch_async(dispatch_get_main_queue(), {
//                    [weak self] in
////                    self?.tbView?.reloadSections(NSIndexSet(index: 1), withRowAnimation: .None)
//                    self?.tbView?.reloadData()
//                })
            }
        }
    }





////
extension FoodCourseViewController: FCSerialCellDelegate {

    
    

    func didSelectSerialAtIndex(index: Int) {
        
        
        
        serialIndex = index
        tbView?.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
        
        
        
        
        
    }
    
    
    
    func changeExpandState(isExpand: Bool) {
        
        
        serialisExpand = isExpand
        
        
        tbView?.reloadRowsAtIndexPaths([NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: .Automatic)
        
        
        
        
    }
    
    
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        
        let h: CGFloat = 70
        
        if scrollView.contentOffset.y > h{
            
            
            scrollView.contentInset = UIEdgeInsetsMake(-h, 0, 0, 0)
            
        }else if scrollView.contentOffset.y > 0 {
            
            
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0,0 , 0)
            
            
            
        }
        
        if commentModel?.data?.total != nil{
        
        let totalCount =  NSString(string: (commentModel?.data?.total)!).integerValue
        
            
            if totalCount == commentModel?.data?.data?.count {
            
            
                return
            
            }
            
            
            
        }
        
    
        let offset: CGFloat = 40
        
        if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.bounds.size.height - offset {
        
            
            
            curPage += 1
            
            
            downloadCommentData()
            
    
        }
        
    

}

////


}




