//
//  clipPayViewController.swift
//  FoodAppClip
//
//  Created by  фф on 19.05.2021.
//

import UIKit
import StoreKit

class clipPayViewController: ViewController {

    var conver: Int = 10
    var price: Int = 0
    
    @IBOutlet var mainBaclView: UIView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var addressView: UIView!
    @IBOutlet var conversionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet var backView: UIView!
    @IBOutlet var appPayImage: UIImageView!
    @IBOutlet var payButton: UIButton!
    @IBOutlet var doneLabel: UILabel!
    @IBOutlet var fullAppButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activity.hidesWhenStopped = true
        doneLabel.isHidden = true
        fullAppButton.isHidden = true
        
        addressLabel.text! = "Пушкинская 19"
        conversionLabel.text! = String(conver) + " %"
        priceLabel.text! = String(price - ((price/100) * conver)) + " Р"
        
        addressView.layer.cornerRadius = 7
        backView.layer.cornerRadius = 15
        payButton.layer.cornerRadius = 10
        mainBaclView.layer.cornerRadius = 10
    }
    
    @IBAction func pay(_ sender: Any){
        appPayImage.isHidden = true
        backView.isHidden = false
        activity.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [self] (t) in
            activity.hidesWhenStopped = true
            backView.isHidden = true
            appPayImage.isHidden = false
            self.appPayImage.image = UIImage(named: "checkicon")
            doneLabel.isHidden = false
            fullAppButton.isHidden = false
        }
    }
    
    @IBAction func fullApp(_ sender: Any) {
        guard let scene = view.window?.windowScene else {return}
        let config = SKOverlay.AppClipConfiguration(position: .bottom)
        let overlay = SKOverlay(configuration: config)
        overlay.present(in: scene)
    }
    
}
