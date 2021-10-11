//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 石田 真苗 on 2021/10/07.
//

import UIKit

class ViewController: UIViewController {

    // outletの接続
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var slideshowButton: UIButton!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    //
    var display_image = ""

    // スライドショーさせる画像の配列を宣言
    var imageArray = [
        "world heritage1.jpeg",
        "world heritage2.jpeg",
        "world heritage3.jpeg"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        display_image = imageArray[nowIndex]
        imageView.image = UIImage(named: display_image)

    }

    // 再生ボタンを押した時の処理
    @IBAction func slideshowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            slideshowButton.setTitle("停止", for: .normal)
            forwardButton.isEnabled = false
            backButton.isEnabled = false

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            slideshowButton.setTitle("再生", for: .normal)
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        }
    }

    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        display_image = imageArray[nowIndex]
        imageView.image = UIImage(named: display_image)
    }
    
    // 進むボタンを押した時の処理
    @IBAction func forwardButton(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        display_image = imageArray[nowIndex]
        imageView.image = UIImage(named: display_image)
    }
        
    
    // 戻るボタンを押した時の処理
    @IBAction func backButton(_ sender: Any) {
        // indexを減らして表示する画像を切り替える
        nowIndex -= 1

        // indexが負の値になった場合
        if (nowIndex == -1) {
            // indexを一番最後の数字に戻す
            nowIndex = imageArray.count - 1
        }
        // indexの画像をstoryboardの画像にセットする
        display_image = imageArray[nowIndex]
        imageView.image = UIImage(named: display_image)
    }
    
    // 画像を押した時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 再生中か停止しているかを判定
        if (timer != nil) {
            // 停止時の処理を実装
        
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に直しておく
            slideshowButton.setTitle("再生", for: .normal)
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        }
        
        // 表示中の画像を引き継ぎ
        let imageViewController = segue.destination as! ResultViewController
        imageViewController.image = imageView.image
    }
    
    // 遷移後の画面で戻るボタンを押した時の処理
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
    
}


