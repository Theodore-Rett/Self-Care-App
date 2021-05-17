//
//  GoodPicturesViewController.swift
//  Self Care App
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class GoodPicturesViewController: UIViewController {
    
    var imageList = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image7",
        "image8",
        "image9",
        "image10",
        "image11",
        "image12",
        "image13",
        "image14",
        "image15"
    ]
    
    @IBOutlet weak var imageDisplay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageDisplay.image = UIImage(named: imageList[Int.random(in : 0 ... 14)])
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func NewPicture(_ sender: UIButton) {
        imageDisplay.image = UIImage(named: imageList[Int.random(in : 0 ... 14)])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
