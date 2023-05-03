//
//  BannerVC.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 28.04.2023.
//

import UIKit

class BannerVC: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "banner1")
        return image
        
    }()
    
    let titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Привет, Александр"
        lbl.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
        
    }
    
    func configure(image: String, title: String) {
        imageView.image = UIImage(named: image)
        titlelabel.text = title
    }
    
    private func setupView() {
        view.addSubview(imageView)
        view.addSubview(titlelabel)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -32),
            
            titlelabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
}
