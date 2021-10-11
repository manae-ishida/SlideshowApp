//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 石田 真苗 on 2021/10/11.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 2画面目のUIImageViewを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var zoom_imageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoom_imageView.image = image

    }

}
