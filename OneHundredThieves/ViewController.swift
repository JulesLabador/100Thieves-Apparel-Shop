//
//  ViewController.swift
//  OneHundredThieves
//
//  Created by Jules Labador on 1/16/19.
//  Copyright © 2019 Jules Labador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }

    let apparelShopLabel: UILabel = {
       
        let label = UILabel()
        label.text = "APPAREL SHOP"
        label.font = UIFont(name: "Avenir-Black", size: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let shopView = ShopView()
    func setupViews() {
        
        view.backgroundColor = UIColor.rgb(red: 249, green: 250, blue: 251)
        
        view.addSubview(apparelShopLabel)
        apparelShopLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        apparelShopLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        
        view.addSubview(shopView)
        shopView.topAnchor.constraint(equalTo: apparelShopLabel.bottomAnchor, constant: -32).isActive = true
        shopView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        shopView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        shopView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}
extension UIColor {
    
    class func rgb(red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha))
    }
    class func rgb(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(1))
    }
    
}
