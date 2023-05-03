//
//  ProductPresent.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 25.04.2023.
//

import UIKit

class ProductPresentVC: UIViewController {
    
    private var ingredient = [String]()
    
    let titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Pizza1"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza1")
        image.contentMode = .scaleAspectFill
        //        image.frame.size.height = 30
        //        image.frame.size.width = 30
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "пицца карбонара с сыром и колбасками"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("от 999 т", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.setTitleColor(.systemGray, for: .normal)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray.cgColor
        btn.layer.contents = UIImage(named: "dodo coin")?.cgImage
        btn.layer.contentsGravity = .resizeAspectFill
        btn.layer.masksToBounds = true

        return btn
    }()
    
    lazy var smallButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Маленькая", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.orange, for: .selected)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        btn.addTarget(self, action: #selector(smallButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var middleButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Средняя", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.orange, for: .selected)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        btn.addTarget(self, action: #selector(mediumButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var bigButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Большая", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.orange, for: .selected)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        btn.addTarget(self, action: #selector(bigButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc func smallButtonTapped(sender: UIButton) {
        button.setTitle("1500 T", for: .normal)
        button.setTitleColor(.white, for: .normal)
        smallButton.isSelected = true
        middleButton.isSelected = false
        bigButton.isSelected = false
    }
    @objc func mediumButtonTapped() {
        button.setTitle("2000 T", for: .normal)
        button.setTitleColor(.white, for: .normal)
        smallButton.isSelected = false
        middleButton.isSelected = true
        bigButton.isSelected = false
    }
    @objc func bigButtonTapped() {
        button.setTitle("2600 T", for: .normal)
        button.setTitleColor(.white, for: .normal)
        smallButton.isSelected = false
        middleButton.isSelected = false
        bigButton.isSelected = true
    }
    
    func configure(image: String, title: String, descrip: String, buttTitle: String) {
        productImage.image = UIImage(named: image)
        titlelabel.text = title
        descriptionLabel.text = descrip
        button.setTitle(buttTitle, for: .normal)
    }
    
    func navigationSetup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(dismissSelf))
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationSetup()
        view.backgroundColor = .white
    }

    
    func setupUI() {
        view.addSubview(titlelabel)
        view.addSubview(productImage)
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        view.addSubview(smallButton)
        view.addSubview(middleButton)
        view.addSubview(bigButton)
        
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        productImage.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        smallButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        bigButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
              
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: view.frame.width),
            
            titlelabel.topAnchor.constraint(equalTo: productImage.bottomAnchor),
            titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titlelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titlelabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            
            smallButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            smallButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            smallButton.widthAnchor.constraint(equalToConstant: 110),
            
            middleButton.leadingAnchor.constraint(equalTo: smallButton.trailingAnchor, constant: 10),
            middleButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            middleButton.widthAnchor.constraint(equalToConstant: 110),
            
            bigButton.leadingAnchor.constraint(equalTo: middleButton.trailingAnchor, constant: 10),
            bigButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            bigButton.widthAnchor.constraint(equalToConstant: 110),
            
        ])
    }
}


extension ProductPresentVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return IngredientInfo.image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: IngredientsPizzaCell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsPizzaCell.reuseID, for: indexPath) as? IngredientsPizzaCell else { return UICollectionViewCell()}
        let image = IngredientInfo.image[indexPath.item] // в коллекции используем item вместо row
        let name = IngredientInfo.name[indexPath.item]
        let price = IngredientInfo.price[indexPath.item]
        cell.configure(image: image, title: price, descrip: name)
        
        
        return cell
    }
    
    
    
    
    
}
