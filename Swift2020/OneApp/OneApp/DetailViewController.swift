//
//  DetailViewController.swift
//  OneApp
//
//  Created by nonoho.honda on 2020/05/31.
//  Copyright © 2020 nonoho.honda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var memoTextView: UITextView!

    var selectedRow:Int!
    var selectedMemo : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo
        
        memoTextView.layer.cornerRadius = 10
         // 影の濃さ
        memoTextView.layer.shadowOpacity = 0.7
         // 影のぼかしの大きさ
         memoTextView.layer.shadowRadius = 3
         // 影の色
         memoTextView.layer.shadowColor = UIColor.black.cgColor
         // 影の方向（width=右方向、height=下方向）
         memoTextView.layer.shadowOffset = CGSize(width: 5, height: 5)

    }

    @IBAction func deleteMemo(_ sender: Any) {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as![String]
            saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray" )
            ud.synchronize()
            //画面遷移

            self.navigationController?.popViewController(animated: true)
        }
    }
}
