//
//  GuidelineModalViewController.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit
import Alamofire

class GuidelineModalViewController: UIViewController {

    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var commentText: UITextView!
    @IBOutlet weak var guidelineText: UILabel!
    @IBOutlet weak var modalTopContraints: NSLayoutConstraint!
    
    var productPageVCDelegate : ProductPageViewController?
    var brandVCDelegate: BrandViewController?
    var brand: Brand?
    var serverURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guidelineText.text = "Adhere to all applicable laws and abide by all Brand policies.Maintain current account information.\nNever misrepresent yourself.\nAlways act in a manner that ensures a trustworthy experience for this brand's customers."
        commentText.delegate = self
        brandName.text = brand?.Name

        modalTopContraints.constant = LayoutHelper.topBarHeight(productPageVCDelegate) + 80

    }
    
    
    @IBAction func applyForBrand(_ sender: Any) {
        let postData : [String: Any] = [
            "userId": 142,
            "applicationDescription": commentText.text ?? "",
            "dateSubmitted": "2016-02-29 12:24:26",
        ]
        Alamofire.request(serverURL, method: .post, parameters: postData, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
 
            if response.result.isSuccess {
                let alert  = UIAlertController(title: "Success", message: "Welcome to the  brand", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in self.dismiss(animated: true, completion: nil) }))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                print(response.result.error ?? "")
                let alert  = UIAlertController(title: "Sorry, \(response.result.error!)", message: "Contact customer service for support", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in self.dismiss(animated: true, completion: nil) }))
                self.present(alert, animated: true, completion: nil)

            }
        }
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension GuidelineModalViewController : UITextViewDelegate {
    func textViewDidBeginEditing (_ textView: UITextView) {
        if  commentText.isFirstResponder {
            commentText.text = nil
            commentText.textColor = .white
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        if commentText.text.isEmpty || commentText.text == "" {
            commentText.textColor = .lightGray
            commentText.text = "Type message here..."
        }
    }
}
