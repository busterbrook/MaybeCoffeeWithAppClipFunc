//
//  clipTovarViewController.swift
//  FoodAppClip
//
//  Created by  фф on 19.05.2021.
//

import UIKit

class clipTovarViewController: ViewController {

    var countProduct: Int = 1
    
    @IBOutlet var imageTovar: UIImageView!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var button: UIButton!
    @IBOutlet var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTovar.image = UIImage(named: "cheez")
        aboutLabel.text! = "Нежный чизкейк с клубникой"
        nameLabel.text! = "Чизкейк"
        weightLabel.text! = "100"
        priceLabel.text! = "125"
        countLabel.text! = String(countProduct)
        
        button.layer.cornerRadius = 10
        backView.layer.cornerRadius = 10
        imageTovar.layer.cornerRadius = 10
        
    }
    
    @IBAction func plus(_ sender: Any) {
        countProduct += 1
        countLabel.text! = String(countProduct)
    }
    
    @IBAction func minus(_ sender: Any) {
        if countProduct - 1 > 0{
            countProduct -= 1
            countLabel.text! = String(countProduct)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showSecond" else { return }
        guard let destination = segue.destination as? clipPayViewController else { return }
        destination.price = Int(priceLabel.text!)! * countProduct
    }
    
}
