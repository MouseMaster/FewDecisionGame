//
//  ViewController.swift
//  用點腦好嗎
//
//  Created by MouseMaster on 2017/7/5.
//  Copyright © 2017年 Toby Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playerCount:UInt = 21
    var yesPlayer:UInt?
    var noPlayer:UInt?
    var token:Bool?
    var index = 0
    @IBOutlet weak var ruleText: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var goToResult: UIButton!
    
    
    let questionArray:Array = [
        
        "問題: 你有比姚明高嗎？",
        "問題: 你認爲愛情比麵包還重要嗎？",
        "問題: 你的鼻子比成龍還大嗎？",
        "問題: 彼得潘有比劉德華帥嗎？",
        "問題: 你有誠實作答嗎？",
        "問題: 你相信錢是萬能的嗎？",
        "問題: 你喜歡看海勝過爬山嗎？"
        ]
    
    let imageArrary:Array = [
        #imageLiteral(resourceName: "yoaMing"),
        #imageLiteral(resourceName: "bread"),
        #imageLiteral(resourceName: "Jackie"),
        #imageLiteral(resourceName: "AndyLau"),
        #imageLiteral(resourceName: "peterpan"),
        #imageLiteral(resourceName: "money"),
        #imageLiteral(resourceName: "mountainSea")
        ]
    
    
    
    @IBAction func goToResult(_ sender: UIButton) {
    performSegue(withIdentifier:"resultSegue", sender: self)
    }
    
    
    func callVoteYes() -> (UInt, UInt, Bool){
    yesPlayer = UInt(Int(arc4random_uniform(UInt32(playerCount + 1 ))))
    noPlayer = playerCount - yesPlayer!
    yesPlayer = yesPlayer! + 1
    token = true
    //print(" Yes: \(yesPlayer!), No: \(noPlayer!)")
    return (yesPlayer!, noPlayer!, token!)
    }
    
    
    func callVoteNo() ->(UInt, UInt, Bool){
    noPlayer = UInt(Int(arc4random_uniform(UInt32(playerCount + 1))))
    yesPlayer = playerCount - noPlayer!
    noPlayer = noPlayer! + 1
    token = false
    //print(" Yes: \(yesPlayer!), No: \(noPlayer!)")
    return (yesPlayer!, noPlayer!, token!)
    }
    
    @IBAction func voteYes(_ sender: Any) {
    goToResult.isHidden = false
    callVoteYes()
    }
    
    @IBAction func voteNo(_ sender: Any) {
    goToResult.isHidden = false
    callVoteNo()
    }
    
    
    @IBAction func gobackToFirstPage(sender:UIStoryboardSegue) {
        if let sourceViewController = sender.source as? SecondViewController{
           playerCount = sourceViewController.totalCount - 1
           goToResult.isHidden = true
           ruleText.text = "目前玩家共 \(playerCount + 1) 位,一人一票.看完題目後,請點選按鈕投票. 提醒您, 少數決遊戲將會淘汰多數方的所有玩家. Good Luck..."
            
            if index == questionArray.count - 1 {
             index = 0
            } else {
            index = index + 1
            }
            
            questionLable.text = questionArray[index]
            imageShow.image = imageArrary[index]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "resultSegue"{
        let controller = segue.destination as! SecondViewController
        controller.voteYesResult = yesPlayer
        controller.voteNoResult = noPlayer
        controller.playerToken = token
        controller.totalCount = playerCount
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

