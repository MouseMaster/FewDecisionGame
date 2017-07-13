//
//  SecondViewController.swift
//  用點腦好嗎
//
//  Created by MouseMaster on 2017/7/8.
//  Copyright © 2017年 Toby Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var totalCount:UInt!
    var voteYesResult:UInt!
    var voteNoResult:UInt!
    var playerToken:Bool!
    
    @IBOutlet weak var LabelAShowYes: UILabel!
    @IBOutlet weak var LableBShowNo: UILabel!
    @IBOutlet weak var mostPeople: UIButton!
    @IBOutlet weak var lessPeople: UIButton!
    @IBOutlet weak var draw: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Vote Yes =\(voteYesResult), Vote No =\(voteNoResult)")
        LabelAShowYes.text = String(voteYesResult)+"人"
        LableBShowNo.text = String(voteNoResult)+"人"
        
        
        
        if (playerToken == false && voteNoResult == 2 && voteYesResult > voteNoResult) || (playerToken == true && voteYesResult == 2 && voteNoResult > voteYesResult) {
         mostPeople.isHidden = false
         mostPeople.setTitle("恭喜最後兩位玩家都是贏家！", for: .normal)
         mostPeople.setTitleColor(UIColor.brown, for: .normal)
        //少數決玩家淘汰到剩下2位,2位少數都勝利
        }else if playerToken == true && voteYesResult == 1{
         mostPeople.isHidden = false
         mostPeople.setTitle("你是最後一位少數,恭喜你贏得勝利！", for: .normal)
         mostPeople.setTitleColor(UIColor.brown, for: .normal)
        //玩家投Yes是最後1個少數,勝利
        }else if playerToken == false && voteNoResult == 1{
         mostPeople.isHidden = false
         mostPeople.setTitle("你是最後一位少數,恭喜你贏得勝利！", for: .normal)
         mostPeople.setTitleColor(UIColor.brown, for: .normal)
        //玩家投No是最後1個少數,勝利
        }else if playerToken == true && voteYesResult > voteNoResult {
         mostPeople.isHidden = false
        //玩家投YES是多數被淘汰
        }else if playerToken == true && voteYesResult < voteNoResult{
         mostPeople.isHidden = true
         lessPeople.isHidden = false
         totalCount = voteYesResult
        //玩家投YES是少數到下一關
        }else if playerToken == false && voteYesResult > voteNoResult {
         mostPeople.isHidden = true
         lessPeople.isHidden = false
         totalCount = voteNoResult
        //玩家投NO是少數到下一關
        }else if playerToken == false && voteYesResult < voteNoResult {
         mostPeople.isHidden = false
        //玩家投ＮO是多數被淘汰
        }else if voteYesResult == voteNoResult{
         lessPeople.isHidden = false
         lessPeople.setTitle("兩方平手,點此按鈕繼續投票>>>", for: .normal)
         lessPeople.setTitleColor(UIColor.brown, for: .normal)
         totalCount = voteYesResult + voteNoResult
        //平局
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
