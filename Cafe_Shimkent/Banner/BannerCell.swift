//
//  BannerCell.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 19.04.2023.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    static let reuseID = "BannerCell"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "banner1")
        image.contentMode = .center
        return image
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(string: String) {
        imageView.image = UIImage(named: string)
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
         //   imageView.topAnchor.constraint(equalTo: topAnchor),
        //    imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 105)
        ])
        
    }
}
