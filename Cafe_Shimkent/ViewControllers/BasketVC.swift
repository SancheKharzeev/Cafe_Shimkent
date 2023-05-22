//
//  BasketVC.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 27.04.2023.
//

import UIKit

class BasketVC: UIViewController {
    
    public var whatGoods = [BasketInfo]()
    let vc = ProductPresentVC()
       
    func setProducts() {
        let vc = ProductPresentVC()
        whatGoods = vc.basketStore
        print(whatGoods)
    }
    
    let titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Добавлено в корзину"
        lbl.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(BasketCell.self, forCellReuseIdentifier: BasketCell.reuseID)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .none
        tableview.separatorStyle = .singleLine
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
        view.backgroundColor = .white
        title = "Корзина"
        self.tabBarItem = tabBarsItemSet
        setupViews()
        setProducts()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupViews() {
        view.addSubview(titlelabel)
        view.addSubview(tableView)
        
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titlelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    

}

extension BasketVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return numberOfGoods.count
        vc.defaults.integer(forKey: "count")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.reuseID, for: indexPath) as? BasketCell else {
            return UITableViewCell()}
        let products = vc.defaults.string(forKey: "\(indexPath.row)image")
        let titleProd = vc.defaults.string(forKey: "\(indexPath.row)title")
        let priceString = vc.defaults.string(forKey: "\(indexPath.row)price")
        let price = "\(priceString ?? "2000") T"
        let buttitle = vc.defaults.string(forKey: "\(indexPath.row)price")
        let size = vc.defaults.string(forKey: "\(indexPath.row)size")
        cell.configure(image: products!, title: titleProd!, descrip: size!, buttTitle: buttitle!, price: price)
       print("\(indexPath.row)image")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
