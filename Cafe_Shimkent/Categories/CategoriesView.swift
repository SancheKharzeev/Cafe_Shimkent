//
//  CategoriesView.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 24.04.2023.
//

import UIKit

class CategoriesView: UITableViewHeaderFooterView, UICollectionViewDelegate {
    
    private var categories: [String] = [] // переменная где будут категории
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.reuseID)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    init(categories: [String]) {
        self.categories = categories
        super.init(reuseIdentifier: CategoriesCell.reuseID)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(collectionView)
        
        layer.shadowOffset = CGSize(width: -5, height: 5)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 8
        layer.shadowColor = UIColor.gray.cgColor
      
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
 /*
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize  // авторазмер ячейки исходя из размера содержания
        layout.itemSize = .init(width: 110, height: 125)  // размер ячеек
        layout.scrollDirection = .horizontal // направление движения
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = .init(top: 2, left: 5, bottom: 2, right: 5)
        return layout
    }
}
*/
    
private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
    return UICollectionViewCompositionalLayout(section: createCompositionView())
}

    private func createCompositionView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1)))
       
       
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -110)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
}

extension CategoriesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CategoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.reuseID, for: indexPath) as? CategoriesCell else { return UICollectionViewCell()}
        cell.titleLabel.text = categories[indexPath.item]
        return cell
    }
    
    
}
