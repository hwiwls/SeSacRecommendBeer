//
//  ViewController.swift
//  SeSacRecommendBeer
//
//  Created by hwijinjeong on 1/16/24.
//

import UIKit
import Kingfisher

class RecommendBeerViewController: UIViewController {
    
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var recommendBtn: UIButton!
    let manager = BeerAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
    }

    func configViews() {
        let randomInt = Int.random(in: 1...25)
        manager.callRequest(number: randomInt) { name, description, image_url  in
            self.nameLabel.text = name
            self.descriptionLabel.text = description
            
            let url = URL(string: image_url)
            self.beerImageView.kf.setImage(with: url)
        }
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        let randomInt = Int.random(in: 1...25)
        
        manager.callRequest(number: randomInt) { name, description, image_url  in
            self.nameLabel.text = name
            self.descriptionLabel.text = description
            
            let url = URL(string: image_url)
            self.beerImageView.kf.setImage(with: url)
        }
    }
    
}

