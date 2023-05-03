//
//  BasketVC.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 27.04.2023.
//

import UIKit

class BasketVC: UIViewController {
    
    public var numberOfGoods = [Int]()
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(BasketCell.self, forCellReuseIdentifier: BasketCell.reuseID)
        tableview.delegate = self
        tableview.dataSource = self
      //  tableview.tableHeaderView = bannerHeaderView
        tableview.separatorStyle = .none
        return tableview
    }()

    //MARK: TabBar
    let tabBarsItemSet = {
        let tabBarItemVC = UITabBarItem()
        tabBarItemVC.image = UIImage(systemName: "basket")
        tabBarItemVC.selectedImage = UIImage(systemName: "basket.fill")
        tabBarItemVC.title = "Корзина"
        return tabBarItemVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Корзина"
        self.tabBarItem = tabBarsItemSet
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
    

}

extension BasketVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfGoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.reuseID, for: indexPath) as? BasketCell else {
            return UITableViewCell()}
        let products = ProductInfo.products[indexPath.row]
        let titleProd = ProductInfo.titleProducts[indexPath.row]
        let descript = ProductInfo.descriptionProducts[indexPath.row]
        let button = "от \(ProductInfo.price[indexPath.row]) T"
        let price = ProductInfo.price[indexPath.row]
        cell.configure(image: products, title: titleProd, descrip: descript, buttTitle: button, price: price)
        return cell
    }
}
