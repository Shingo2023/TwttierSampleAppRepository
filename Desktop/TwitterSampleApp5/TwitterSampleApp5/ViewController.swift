//
//  ViewController.swift
//  TwitterSampleApp5
//
//  Created by 高橋真悟 on 2024/01/05.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newTweetButton: UIButton!
    @IBAction func newTweetButton(_ sender: UIButton) {
        transitiontoTweetEditView()
    }
    
    var twitterDataList: [TweetDataModel] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TwitterHomeTableViewCell", bundle: nil),forCellReuseIdentifier: "twitterHomeTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        //エラー　'ViewController' 型の値を '(任意の UITableViewDelegate)?' 型に割り当てることはできません。
        
        tableView.tableFooterView = UIView()
        setTwitterData()//34行目のインスタンス化
    }
    
    
    func setTwitterData() {
        let tweetDataModel = TweetDataModel(userName: "ユーザー名",recordDate: Date(), tweetText: "これは(i)番目のツイートです。このツイートは文章が続くと下に伸びて表示されます。")
        
        twitterDataList.append(tweetDataModel)
        
        configureNewTweetButton()
    }
    func configureNewTweetButton() { //configure 構成
        newTweetButton.layer.cornerRadius = newTweetButton.bounds.width / 2
    }
    func transitiontoTweetEditView() { //transitionto 移行
        let storyboard = UIStoryboard(name: "TweetEditViewController", bundle: nil)
        guard let tweetEditViewController = storyboard.instantiateViewController(identifier: "TweetEditViewController") as?
                TweetEditViewController else { return }//エラー「UIViewController」から無関係なタイプ「TweetEditViewController」へのキャストは常に失敗します
        present(tweetEditViewController, animated: true)
        //presentメソッドでモーダル遷移している　デリゲートが機能したら使えるかも
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//セル数を決めるメソッド
            return twitterDataList.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//セルを定義しているメソッド
        let cell = tableView.dequeueReusableCell(withIdentifier:twiiterHomeViewTableCell, for: indexPath) as! TwiiterHomeViewTableCell
        let twitterDataModel: TweetDataModel = twitterDataList[indexPath.row]
        cell.setup(userName: twitterDataModel.userName, recordDataLabel: twitterDataModel.recordDate, twitterText: twitterDataModel.tweetText)
        return cell }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//セルがタップされた際にタップさせたインデックス番号が渡されるメソッド
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
}

