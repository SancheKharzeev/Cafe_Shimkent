//
//  CategoriesCell.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 24.04.2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let reuseID = "CategoriesCell"
    
    public let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Pizza"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.cornerRadius = 20
                layer.borderWidth = 2
                layer.borderColor = UIColor.black.cgColor
                layer.backgroundColor = UIColor.orange.cgColor
                titleLabel.textColor = .white
            } else {
                layer.borderColor = UIColor.orange.cgColor
                layer.backgroundColor = .none
                titleLabel.textColor = .black
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
    private func setupView() {
        contentView.addSubview(titleLabel)
        titleLabel.contentMode = .scaleAspectFill
        titleLabel.clipsToBounds = true
        titleLabel.layer.cornerRadius = 20
        titleLabel.layer.borderWidth = 2
        titleLabel.layer.borderColor = UIColor.orange.cgColor
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            titleLabel.heightAnchor.constraint(equalToConstant: 45),
//            titleLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
