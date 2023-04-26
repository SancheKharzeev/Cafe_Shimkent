//
//  ViewController.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
     
    let allBanners = BannerInfo.allBanners
    
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableHeaderView = bannerHeaderView
        tableview.separatorStyle = .none
        return tableview
    }()
    
    lazy var bannerHeaderView: BannerView = { // UICollectionView будет в отдельном UIView
        let width = UIView.screenWidth
        let height = width * 0.35 // высота видимого поля в collectionView
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return bannerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cafe Shimkent"
        view.backgroundColor = .white
        setupViews()
        bannerHeaderView.update(bannersString: allBanners)
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
    
    func showMyViewControllerInACustomizedSheet(image: String, title: String, descrip: String, buttTitle: String) {
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
            viewControllerToPresent.button.setTitle("В корзину за \(buttTitle) T", for: .normal)
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
        //products.count
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
        
        
        showMyViewControllerInACustomizedSheet(image: products, title: titleProd, descrip: descript, buttTitle: button)
    }
}

