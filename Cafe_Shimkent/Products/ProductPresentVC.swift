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
        image.contentMode = .center
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
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        btn.setImage(UIImage(named: "pizza1"), for: .selected)
        return btn
    }()
    
    let smallButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Маленькая", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        btn.setImage(UIImage(named: "pizza1"), for: .selected)
        return btn
    }()
    
    let middleButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Средняя", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        btn.setImage(UIImage(named: "pizza1"), for: .selected)
        return btn
    }()
    
    let bigButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Большая", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray6.cgColor
        btn.setImage(UIImage(named: "pizza1"), for: .selected)
        return btn
    }()
    
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
    
    //MARK: - collectionView
   /*
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(IngredientsPizzaCell.self, forCellWithReuseIdentifier: IngredientsPizzaCell.reuseID)
        collectionView.backgroundColor = .systemPink
        return collectionView
    }()
    
    
    
    private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
        return UICollectionViewCompositionalLayout(section: createCompositionView())
    }

    private func createCompositionView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))

        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -10)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .paging
        return section

    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationSetup()
        view.backgroundColor = .white
//        collectionView.dataSource = self
//        collectionView.delegate = self
        
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//    }

    
    func setupUI() {
        view.addSubview(titlelabel)
        view.addSubview(productImage)
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        view.addSubview(smallButton)
        view.addSubview(middleButton)
        view.addSubview(bigButton)
//        view.addSubview(collectionView)
        
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        productImage.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        smallButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        bigButton.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
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
 /*
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
*/
            
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
