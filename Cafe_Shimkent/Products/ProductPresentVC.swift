//
//  ProductPresent.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 25.04.2023.
//

import UIKit

class ProductPresentVC: UIViewController {
    
    private var ingredient = [String]()
    
    var basketStore = [BasketInfo]()
    
    //тут хранятся выбранные параметры пиццы
    public var defaultPizzaSize = "Большая"
    public var defaultPizzaPrice = 2600
    public var defaultImage = ""
    public var defaultTitle = ""
    public var selectedProducts = BasketInfo(title: ["Большая"], price: [2600], image: ["promo"])
    let defaults = UserDefaults.standard
    var count = 0
    
    func makeSelectedProducts() -> BasketInfo {
        selectedProducts =  BasketInfo(title: [defaultPizzaSize], price: [defaultPizzaPrice], image: [defaultImage])
        return selectedProducts
    }
    
    let titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Карбонара"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza1")
        image.contentMode = .scaleAspectFit
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
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("\(defaultPizzaPrice) Т", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.setTitleColor(.systemGray, for: .normal)
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.systemGray.cgColor
        btn.layer.contents = UIImage(named: "dodo coin")?.cgImage
        btn.layer.contentsGravity = .resizeAspectFill
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        
        switch titlelabel.text {
        case "Карбонара":
            print("this is a \(String(describing: titlelabel.text))")
        case "Напиток 7UP", "Напиток Mirinda":
            smallButton.isHidden = true
            middleButton.isHidden = true
            bigButton.isHidden = true
            ingredientBottomView.isHidden = true
        default:
            print("Oops default \(String(describing: titlelabel.text))")
        }
        return btn
    }()
    
    
    @objc func buyButtonTapped() {
        defaults.set(defaultPizzaPrice, forKey: "\(count)price")
        defaults.set(defaultPizzaSize, forKey: "\(count)size")
        defaults.set(defaultImage, forKey: "\(count)image")
        defaults.set(defaultTitle, forKey: "\(count)title")
        
        makeSelectedProducts()
        count += 1
        defaults.set(count, forKey: "count")
        print(count)
        dismiss(animated: true)
    }
    
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
        defaultPizzaPrice = 1500
        defaultPizzaSize = "Маленькая"
        button.setTitle("\(defaultPizzaPrice) T", for: .normal)
        button.setTitleColor(.white, for: .normal)
        smallButton.isSelected = true
        middleButton.isSelected = false
        bigButton.isSelected = false
    }
    @objc func mediumButtonTapped() {
        defaultPizzaPrice = 2000
        defaultPizzaSize = "Средняя"
        button.setTitle("\(defaultPizzaPrice) T", for: .normal)
        button.setTitleColor(.white, for: .normal)
        smallButton.isSelected = false
        middleButton.isSelected = true
        bigButton.isSelected = false
        
    }
    @objc func bigButtonTapped() {
        defaultPizzaPrice = 2600
        defaultPizzaSize = "Большая"
        button.setTitle("\(defaultPizzaPrice) T", for: .normal)
        button.setTitleColor(.white, for: .normal)
        smallButton.isSelected = false
        middleButton.isSelected = false
        bigButton.isSelected = true
    }
    
    lazy var ingredientBottomView: UIView = { // UICollectionView будет в отдельном UIView
        let width = UIView.screenWidth
        let height = width * 0.35 // высота видимого поля в collectionView
        let ingredientView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return ingredientView
    }()
    
    //MARK: - CollectionView
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(IngredientsPizzaCell.self, forCellWithReuseIdentifier: IngredientsPizzaCell.reuseID)
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
        return UICollectionViewCompositionalLayout(section: createCompositionView())
    }
    
    private func createCompositionView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
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
        setupCollectionViews()
    }
    
    //MARK: - SetupUI
    
    func setupUI() {
        view.addSubview(titlelabel)
        view.addSubview(productImage)
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        view.addSubview(smallButton)
        view.addSubview(middleButton)
        view.addSubview(bigButton)
        view.addSubview(ingredientBottomView)
        
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        productImage.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        smallButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        bigButton.translatesAutoresizingMaskIntoConstraints = false
        ingredientBottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 355),
            
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
            
            ingredientBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            ingredientBottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            ingredientBottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            ingredientBottomView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor , constant: 35),
            
        ])
    }
    
    private func setupCollectionViews() {
        ingredientBottomView.addSubview(collectionView)
      
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: ingredientBottomView.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: ingredientBottomView.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: ingredientBottomView.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: ingredientBottomView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UICollectionViewDelegate

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
