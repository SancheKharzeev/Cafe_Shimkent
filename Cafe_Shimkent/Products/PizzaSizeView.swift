//
//  PizzaSizeView.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 25.04.2023.
//

import UIKit

class PizzaSizeView: UIView {
    
    private var pizzaSize: [String] = [] // переменная где будут размеры пиццы
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatCompositionalLayout())
        collectionView.dataSource = self
        collectionView.register(PizzaSizeCell.self, forCellWithReuseIdentifier: PizzaSizeCell.reuseID)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(sizeString: [String]) {
        pizzaSize = sizeString
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
       
       
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
      //  let groupHeight = NSCollectionLayoutDimension.fractionalHeight(1)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
}

extension PizzaSizeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pizzaSize.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PizzaSizeCell = collectionView.dequeueReusableCell(withReuseIdentifier: PizzaSizeCell.reuseID, for: indexPath) as? PizzaSizeCell else { return UICollectionViewCell()}
        cell.titleLabel.text = pizzaSize[indexPath.item]
        return cell
    }
    
    
}

