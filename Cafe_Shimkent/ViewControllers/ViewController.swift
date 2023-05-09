//
//  ViewController.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
     
    let allBanners = BannerInfo.allBanners
    private var banners = [String]()
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableHeaderView = bannerHeaderView
        tableview.separatorStyle = .singleLine
        return tableview
    }()
    
    lazy var bannerHeaderView: UIView = { // UICollectionView будет в отдельном UIView
        let width = UIView.screenWidth
        let height = width * 0.35 // высота видимого поля в collectionView
        let bannerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return bannerView
    }()
    
    //MARK: - collectionView

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseID)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
        return UICollectionViewCompositionalLayout(section: createCompositionView())
    }
    
    private func createCompositionView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -250)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    func update(bannersString: [String]) {
        banners = bannersString
        collectionView.reloadData()
    }
    
    private func setupCollectionViews() {
        bannerHeaderView.addSubview(collectionView)
      
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: bannerHeaderView.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: bannerHeaderView.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: bannerHeaderView.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bannerHeaderView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: - TabBar
    let tabBarsItemSet = {
        let tabBarItemVC = UITabBarItem()
        tabBarItemVC.image = UIImage(systemName: "menucard")
        tabBarItemVC.selectedImage = UIImage(systemName: "menucard.fill")
        tabBarItemVC.badgeValue = "New"
        tabBarItemVC.title = "Menu"
        return tabBarItemVC
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = tabBarsItemSet
        view.backgroundColor = .white
        setupViews()
        setupCollectionViews()
        update(bannersString: allBanners)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.rowHeight = view.bounds.height / 6  // высота ячеек tableView
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func showProductVCInACustomizedSheet(image: String, title: String, descrip: String, buttTitle: String) {
        let viewControllerToPresent = ProductPresentVC()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            
            viewControllerToPresent.titlelabel.text = title
            viewControllerToPresent.productImage.image = UIImage(named: image)
            viewControllerToPresent.descriptionLabel.text = descrip
            viewControllerToPresent.defaultImage = image
            viewControllerToPresent.defaultTitle = title
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
   
    /*
    // передача данных в другой VC при selected row
    private func goToEditNote(image: String, title: String, descrip: String, buttTitle: String) {
        let rootVC = ProductPresentVC()
        rootVC.titlelabel.text = title
        rootVC.productImage.image = UIImage(named: image)
        rootVC.descriptionLabel.text = descrip
        rootVC.button.setTitle("В корзину за \(buttTitle) T", for: .normal)
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
     */
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductInfo.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell else {
            return UITableViewCell()}
        let products = ProductInfo.products[indexPath.row]
        let titleProd = ProductInfo.titleProducts[indexPath.row]
        let descript = ProductInfo.descriptionProducts[indexPath.row]
        let button = "от \(ProductInfo.price[indexPath.row]) T"
        cell.configure(image: products, title: titleProd, descrip: descript, buttTitle: button)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let categories = CategoriesInfo.allCategories
        let view = CategoriesView(categories: categories)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let products = ProductInfo.products[indexPath.row]
        let titleProd = ProductInfo.titleProducts[indexPath.row]
        let descript = ProductInfo.descriptionProducts[indexPath.row]
        let button = ProductInfo.price[indexPath.row]
        
        showProductVCInACustomizedSheet(image: products, title: titleProd, descrip: descript, buttTitle: button)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        
        // передача данных в другой VC при selected row
        func goToEditNote(image: String, title: String) {
            let rootVC = BannerVC()
            rootVC.imageView.image = UIImage(named: image)
            rootVC.titlelabel.text = title
            let navVC = UINavigationController(rootViewController: ViewController())
            navVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: true)
        }
        goToEditNote(image: bannerString, title: bannerString)
    }
}
