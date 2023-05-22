//
//  ViewController.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    var categoryProducts = ""
    var tableDataImage = [String]()
    var tableDataTitle = [String]()
    var tableDataDescription = [String]()
    var tableDataPrice = [String]()
    
    private var categories: [String] = [] // переменная где будут категории
    let allCategories = CategoriesInfo.allCategories
    let allBanners = BannerInfo.allBanners
    private var banners = [String]()
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableview.separatorStyle = .singleLine
        return tableview
    }()
    
    //MARK: - collectionView for Banners
    
    lazy var bannerView: UIView = { // UICollectionView будет в отдельном UIView
        let width = UIView.screenWidth
        let height = width * 0.35 // высота видимого поля в collectionView
        let bannerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return bannerView
    }()
    
    private lazy var bannerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: bannerCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseID)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private func bannerCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
        return UICollectionViewCompositionalLayout(section: bannerCompositionView())
    }
    
    private func bannerCompositionView() -> NSCollectionLayoutSection {
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
        bannerCollectionView.reloadData()
    }
    
    private func setupCollectionViews() {
        bannerView.addSubview(bannerCollectionView)
        categoriesView.addSubview(categCollectionView)
        
        bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bannerCollectionView.topAnchor.constraint(equalTo: bannerView.safeAreaLayoutGuide.topAnchor),
            bannerCollectionView.trailingAnchor.constraint(equalTo: bannerView.safeAreaLayoutGuide.trailingAnchor),
            bannerCollectionView.leadingAnchor.constraint(equalTo: bannerView.safeAreaLayoutGuide.leadingAnchor),
            bannerCollectionView.bottomAnchor.constraint(equalTo: bannerView.safeAreaLayoutGuide.bottomAnchor),
            
            categCollectionView.topAnchor.constraint(equalTo: categoriesView.safeAreaLayoutGuide.topAnchor),
            categCollectionView.trailingAnchor.constraint(equalTo: categoriesView.safeAreaLayoutGuide.trailingAnchor),
            categCollectionView.leadingAnchor.constraint(equalTo: categoriesView.safeAreaLayoutGuide.leadingAnchor),
            categCollectionView.bottomAnchor.constraint(equalTo: categoriesView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: - categoriesView CategCollectionView
    lazy var categoriesView: UIView = { // UICollectionView будет в отдельном UIView
        let width = UIView.screenWidth
        let height = width * 0.15 // высота видимого поля в collectionView
        let categoriesView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return categoriesView
    }()
    
    private lazy var categCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: categCompositionalLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.reuseID)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private func categCompositionalLayout() -> UICollectionViewCompositionalLayout { // создаем макет коллекции
        return UICollectionViewCompositionalLayout(section: categCompositionView())
    }
    
    private func categCompositionView() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -110)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    func updateCategories(categString: [String]) {
        categories = categString
        categCollectionView.reloadData()
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = categoriesView // а внутри баннерВью коллекция с баннерами
        tableDataImage = ProductInfo.products
        tableDataTitle = ProductInfo.titleProducts
        tableDataDescription = ProductInfo.descriptionProducts
        tableDataPrice = ProductInfo.price
        self.tabBarItem = tabBarsItemSet
        view.backgroundColor = .white
        setupViews()
        setupCollectionViews()
        update(bannersString: allBanners)
        updateCategories(categString: allCategories)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.rowHeight = view.bounds.height / 6  // высота ячеек tableView
        
    }
    //MARK: констрейнты
    private func setupViews() {
        view.addSubview(tableView) // тейблВью на всю страницу
        view.addSubview(bannerView)
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 150),
            
            tableView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: Настройка отображения вью и передачи во вью данных выбранного товара
    
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
        return tableDataImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell else {
            return UITableViewCell()}
        let image = tableDataImage[indexPath.row]
        let titleProd = tableDataTitle[indexPath.row]
        let descript = tableDataDescription[indexPath.row]
        let price = "от \(tableDataPrice[indexPath.row]) T"
        cell.configure(image: image, title: titleProd, descrip: descript, buttTitle: price)
        
        return cell
    }
    
    //    //MARK:  это хеддер СЕКЦИИ
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let categories = CategoriesInfo.allCategories
    //        let view = CategoriesView(categories: categories)
    //        return view
    //    }
    //
    //
    //    //MARK:  высота хеддер СЕКЦИИ
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 50
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let products = ProductInfo.products[indexPath.row]
        let titleProd = ProductInfo.titleProducts[indexPath.row]
        let descript = ProductInfo.descriptionProducts[indexPath.row]
        let button = ProductInfo.price[indexPath.row]
        print(indexPath.row)
        showProductVCInACustomizedSheet(image: products, title: titleProd, descrip: descript, buttTitle: button)
    }
}

//MARK: - CollectionViewDataSource Delegate

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return banners.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView {
            
            guard let bannerCell: BannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseID, for: indexPath) as? BannerCell else { return UICollectionViewCell()}
            let banner = banners[indexPath.item] // в коллекции используем item вместо row
            bannerCell.configure(string: banner)
            return bannerCell
        } else {
            guard let categCell: CategoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.reuseID, for: indexPath) as? CategoriesCell else { return UICollectionViewCell()}
            categCell.titleLabel.text = categories[indexPath.item]
            return categCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == bannerCollectionView {
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
        } else {
            var index = IndexPath(row: 0, section: 0)
            let categori = CategoriesInfo.allCategories[indexPath.item]
            switch categori {
                case "Напитки": index = IndexPath(row: 7, section: 0)
                case "Кофе": index = IndexPath(row: 9, section: 0)
                default: index = IndexPath(row: 0, section: 0)
            }
            
            self.tableView.scrollToRow(at: index, at: .top, animated: true)
        }
    }
}
