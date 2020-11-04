//
//  TextViewController.swift
//  LoginWithFirebaseApp
//
//  Created by nonoho.honda on 2020/05/25.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var answerImageView: UIImageView!
    
   
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var secondAnswerLabel: UILabel!
    
    
    @IBOutlet weak var thirdAnswerLabel: UILabel!
    
    
    @IBAction func shuffleAction(_ sender: Any) {
        answerLabel.text = "안녕하세요, 저는 지민입니다."
        secondAnswerLabel.text = "アニョハセヨ、チョヌンジミンイムニダ"
        thirdAnswerLabel.text = "こんにちは、僕はジミンです"
        answerImageView.image = UIImage(named:"jimin1")
    }
}
