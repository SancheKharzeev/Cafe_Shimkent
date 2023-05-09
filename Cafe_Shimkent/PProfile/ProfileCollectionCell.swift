//
//  ProfileCollectionCell.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 01.05.2023.
//

import UIKit

class ProfileCollectionCell: UICollectionViewCell {
    
    static let reuseID = "ProfileCollectionCell"
    
    let coinLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Доступные баллы"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let numbersOfCoinsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "1921"
        lbl.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let descriptionCoinLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Нажмите чтобы потратить"
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        lbl.textColor = .systemGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dodo coin")
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .white
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, number: String?, descr: String, image: String?) {
        coinLabel.text = title
        numbersOfCoinsLabel.text = number
        descriptionCoinLabel.text = descr
        imageView.image = UIImage(named: image ?? "pizza3")
    }
    
    private func setupView() {
        contentView.addSubview(coinLabel)
        contentView.addSubview(numbersOfCoinsLabel)
        contentView.addSubview(descriptionCoinLabel)
        contentView.addSubview(imageView)

       
        
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        numbersOfCoinsLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionCoinLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            coinLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            coinLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            coinLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            numbersOfCoinsLabel.topAnchor.constraint(equalTo: coinLabel.bottomAnchor, constant: 16),
            numbersOfCoinsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            descriptionCoinLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            descriptionCoinLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionCoinLabel.widthAnchor.constraint(equalToConstant: 100),
            
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
    }
}
