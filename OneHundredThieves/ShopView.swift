//
//  ShopCollectionView.swift
//  OneHundredThieves
//
//  Created by Jules Labador on 1/16/19.
//  Copyright © 2019 Jules Labador. All rights reserved.
//

import UIKit

class ShopView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    let apparel: [Apparel] = [Apparel(image: #imageLiteral(resourceName: "WOODLAND_CREWNECK"), name: "WOODLAND CREWNECK"), Apparel(image: #imageLiteral(resourceName: "ROYALTY_LONG_SLEEVE"), name: "ROYALTY LONG SLEEVE"), Apparel(image: #imageLiteral(resourceName: "ORIGINAL_WINDBREAKER"), name: "\"THE ORIGINAL\" WINDBREAKER")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShopCell.self, forCellWithReuseIdentifier: cellID)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath as IndexPath) as? ShopCell else { fatalError("Coudl not dequeue cell") }
        
        cell.imageView.image = apparel[indexPath.row].image
        cell.nameLabel.text = apparel[indexPath.row].name
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height - 32)
    }
    
    let collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.isPagingEnabled = true
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    func setupViews() {
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

class ShopCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
       
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 6
        view.layer.shadowRadius = 15
        view.layer.shadowColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.75).cgColor
        view.layer.shadowOpacity = 0.55
        view.layer.shadowOffset = CGSize(width: 0.5, height: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    let nameLabel: UILabel = {
       
        let label = UILabel()
        label.text = "LABEL"
        label.font = UIFont(name: "Avenir-Heavy", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let soldOutButton: UIButton = {
       
        let button = UIButton()
        button.setTitle("SOLD OUT", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 15)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    func setupViews() {
        
        addSubview(soldOutButton)
        soldOutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        soldOutButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48).isActive = true
        soldOutButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        soldOutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: soldOutButton.leftAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: soldOutButton.topAnchor, constant: -24).isActive = true
        
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.leftAnchor.constraint(equalTo: soldOutButton.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -48).isActive = true
        imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -32).isActive = true
        
    }
}
