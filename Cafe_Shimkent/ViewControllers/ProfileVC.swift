//
//  ProfileVC.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 27.04.2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    let titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Привет, Александр"
        lbl.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemOrange
        //   btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        btn.tintColor = .white
        
        return btn
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileCollectionCell.self, forCellWithReuseIdentifier: ProfileCollectionCell.reuseID)
        collectionView.backgroundColor = .systemOrange
        collectionView.layer.cornerRadius = 10
        collectionView.layer.masksToBounds = true
        return collectionView
    }()
    
    let promoLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Мои акции"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    let promoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "promo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
        
    }()

    //MARK: TabBar
    let tabBarsItemSet = {
        let tabBarItemVC = UITabBarItem()
        tabBarItemVC.image = UIImage(systemName: "person.crop.circle")
        tabBarItemVC.selectedImage = UIImage(systemName: "person.crop.circle.fill")
        tabBarItemVC.title = "Профиль"
        return tabBarItemVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Профиль"
        self.tabBarItem = tabBarsItemSet
        setupUI()
    }
    
    private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
        return UICollectionViewCompositionalLayout(section: createCompositionView())
    }
    
    private func createCompositionView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
       
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
      //  let groupHeight = NSCollectionLayoutDimension.fractionalHeight(1)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }

    func setupUI() {
        view.addSubview(titlelabel)
        view.addSubview(infoView)
        infoView.addSubview(collectionView)
        view.addSubview(promoLabel)
        view.addSubview(promoImage)
        view.addSubview(button)
//        infoView.addSubview(coinLabel)
//        infoView.addSubview(numbersOfCoinsLabel)
//        infoView.addSubview(descriptionCoinLabel)
       
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        infoView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        promoLabel.translatesAutoresizingMaskIntoConstraints = false
        promoImage.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false


//        coinLabel.translatesAutoresizingMaskIntoConstraints = false
//        numbersOfCoinsLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionCoinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
              
            titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titlelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titlelabel.heightAnchor.constraint(equalToConstant: 30),
            
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 40),
            
            
            infoView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 24),
            infoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
 
            collectionView.topAnchor.constraint(equalTo: infoView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: 8),
            collectionView.heightAnchor.constraint(equalToConstant: 150),
            
            promoLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            promoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            promoImage.topAnchor.constraint(equalTo: promoLabel.bottomAnchor, constant: 16),
            promoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            promoImage.heightAnchor.constraint(equalToConstant: 200),
            promoImage.widthAnchor.constraint(equalToConstant: 200)
          
        ])
    }

}

extension ProfileVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileInfo.title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ProfileCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionCell.reuseID, for: indexPath) as? ProfileCollectionCell else { return UICollectionViewCell()}
        let title = ProfileInfo.title[indexPath.item] // в коллекции используем item вместо row
        let number = ProfileInfo.numberCoins[indexPath.item]
        let descr = ProfileInfo.description[indexPath.item]
        let image = ProfileInfo.image[indexPath.item]

        cell.configure(title: title, number: number, descr: descr, image: image)
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let promoString = ProfileInfo.image[indexPath.item]

        // передача данных в другой VC при selected row
         func goToEditNote(image: String) {
            let rootVC = BannerVC()
            rootVC.imageView.image = UIImage(named: image)
            let navVC = UINavigationController(rootViewController: ViewController())
            navVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: true)
        }
        goToEditNote(image: promoString)
    }
    
    
}
