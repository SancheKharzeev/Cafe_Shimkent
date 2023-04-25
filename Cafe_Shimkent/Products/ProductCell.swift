//
//  ProductCell.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 19.04.2023.
//

import UIKit

protocol SomeCellDelegate: AnyObject {
    func didTapCell(_ cell: ProductCell)
}

class ProductCell: UITableViewCell {
    
    weak var delegate: SomeCellDelegate?
    
    static let reuseID = "ProductCell"
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza1")
        image.contentMode = .center
        image.contentMode = .scaleAspectFill
        image.frame.size.height = 130
        image.frame.size.width = 130
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("от 999 т", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        
        return btn
    }()
    
    let titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Pizza1"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "пицца карбонара с сыром и колбасками"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    @objc func didTapButton() {
        delegate?.didTapCell(self)
    }
    
    func configure(image: String, title: String, descrip: String, buttTitle: String) {
        productImage.image = UIImage(named: image)
        titlelabel.text = title
        descriptionLabel.text = descrip
        button.setTitle(buttTitle, for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        layer.cornerRadius = 10
        
        //Add image
        contentView.addSubview(productImage)
        
        //Set constraints as per your requirements
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        productImage.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        productImage.widthAnchor.constraint(equalToConstant: productImage.frame.size.width).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: productImage.frame.size.height).isActive = true
        
        //Add label
        contentView.addSubview(titlelabel)
        //Set constraints as per your requirements
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8).isActive = true
        titlelabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Add label
        contentView.addSubview(descriptionLabel)
        //Set constraints as per your requirements
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
     //   descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Add button
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //Set constraints as per your requirements
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8).isActive = true
 //       button.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 8).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




