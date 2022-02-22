//
//  Modal.swift.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/22.
//
import UIKit

class Dialog {
    
    func showDialog(vc: ViewController) {
        let dialog = UIAlertController(title: "エラー", message: "操作をやり直してください", preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(dialog, animated: true, completion: nil)
    }

}
