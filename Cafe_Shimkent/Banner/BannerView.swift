//
//  BannerView.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 19.04.2023.
//

import UIKit

class BannerView: UIView {
    
    private var banners = [String]()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseID)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    /*
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize  // аторазмер ячейки исходя из размера содержания
   //     layout.itemSize = .init(width: 110, height: 125)  // размер ячеек
        layout.scrollDirection = .horizontal // направление движения
        layout.minimumLineSpacing = 20
        return layout
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(bannersString: [String]) {
        banners = bannersString
        collectionView.reloadData()
    }
    
    private func setupViews() {
        addSubview(collectionView)
      
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
     
    private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
        return UICollectionViewCompositionalLayout(section: createCompositionView())
    }
    
    private func createCompositionView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1)))
       
       
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -10)
        
      //  let groupHeight = NSCollectionLayoutDimension.fractionalHeight(1)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -250)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
        
    }
   
}

extension BannerView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: BannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseID, for: indexPath) as? BannerCell else { return UICollectionViewCell()}
        let banner = banners[indexPath.item] // в коллекции используем item вместо row
        cell.configure(string: banner)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bannerString = BannerInfo.allBanners[indexPath.item]
        print("\(bannerString)")
        
        /*
        // передача данных в другой VC при selected row
         func goToEditNote(image: String) {
            let rootVC = BannerVC()
            rootVC.imageView.image = UIImage(named: image)
            let navVC = UINavigationController(rootViewController: ViewController())
            navVC.modalPresentationStyle = .fullScreen
            navVC.present(rootVC, animated: true)
        }
        goToEditNote(image: bannerString)
        */
    }
}
