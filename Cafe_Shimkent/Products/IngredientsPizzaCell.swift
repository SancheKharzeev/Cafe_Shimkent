//
//  IngredientsPizzaCell.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 26.04.2023.
//

import UIKit
// MARK: Ячейки ингредиентов когда выбираешь пиццу с первого ViewController

class IngredientsPizzaCell: UICollectionViewCell {
    
    static let reuseID = "IngredientsPizzaCell"
    
    private let Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ingredient1")
        image.contentMode = .center
        image.contentMode = .scaleAspectFill
        image.frame.size.height = 100
        image.frame.size.width = 100
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "450Т"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Томаты"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.frame.size.height = 154
                layer.cornerRadius = 20
                layer.borderWidth = 2
                layer.borderColor = UIColor.black.cgColor
                layer.backgroundColor = UIColor.orange.cgColor
                titlelabel.textColor = .white
                
            } else {
                layer.borderColor = UIColor.white.cgColor
                layer.backgroundColor = .none
                titlelabel.textColor = .black
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
   
        //Add Image
        contentView.addSubview(Image)
        
     //Set constraints as per your requirements
        Image.translatesAutoresizingMaskIntoConstraints = false
      //  Image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3).isActive = true
        Image.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        Image.widthAnchor.constraint(equalToConstant: Image.frame.size.width).isActive = true
        Image.heightAnchor.constraint(equalToConstant: Image.frame.size.height).isActive = true
        Image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //Add label
        contentView.addSubview(descriptionLabel)
        //Set constraints as per your requirements
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: Image.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
       
        
        //Add label
        contentView.addSubview(titlelabel)
        //Set constraints as per your requirements
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titlelabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
     
        
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        Image.frame = contentView.bounds
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        Image.image = nil
//    }
    
    func configure(image: String, title: String, descrip: String) {
        Image.image = UIImage(named: image)
        titlelabel.text = title
        descriptionLabel.text = descrip
    }

}
