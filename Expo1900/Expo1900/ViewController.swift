//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var exhibitionTitleLabel: UILabel!
    
    @IBOutlet weak var exhibitionPosterImage: UIImageView!
    
    @IBOutlet weak var exhibitionDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initValues()
    }
    
    private func initValues() {
        let jsonDecoder = JSONDecoder()
        
        guard let exhibitionJsonData = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        guard let exhibitionInfomation = try? jsonDecoder.decode(ExhibitionInfomation.self, from: exhibitionJsonData.data) else { return }
        
        exhibitionTitleLabel.text = exhibitionInfomation.newlineTitle
        exhibitionTitleLabel.textAlignment = .center
        
        exhibitionDescriptionLabel.text = exhibitionInfomation.description
    }
}

