//
//  ProductInfo.swift
//  Cafe_Shimkent
//
//  Created by Александр Х on 20.04.2023.
//

import UIKit

public class ProductInfo {
    
    static var products = ["pizza1", "pizza2", "pizza3", "pizza4", "pizza5", "pizza6", "pizza7", "drink1", "drink2", "coffee1", "coffee2", "coffee3"]
    static var titleProducts = ["Карбонара", "Ветчина и сыр", "Песто", "Овощи и грибы", "Пепперони", "Моцарелла", "Пицца от шефа", "Напиток 7UP", "Напиток Mirinda", "Кофе Американо", "Кофе Капучино", "Кофе Мокка" ]
    static var descriptionProducts = ["Сыр блю чиз, цыпленок, ветчина из цыпленка, сыры чеддер и пармезан, соус песто, кубики брынзы, томаты, красный лук, моцарелла, соус альфредо, чеснок, итальянские травы",
                                      "Пикантная пепперони из цыпленка, ветчина из цыпленка, маринованные огурчики, томаты, моцарелла, томатный соус",
                                      "Пастрами из говядины, острая чоризо, пикантная перерони и сыром чеддер с халапенью и перчиком ",
                                      "Пицца c томатным соусом, моцарелла, острая чоризо с сыром и двойным анчоусом",
                                      "Шампиньоны, томаты, сладкий перец, красный лук, кубики брынзы, моцарелла, томатный соус, итальянские травы",
                                      "Пицца с курицей и перчиком с двойным анчоусом плюс кола в подарок",
                                      "Пастрами из мрамоной говядины, фирменный томатный соус, моцарелла, чеснок, красный лук, сладкий перец, томаты, соус барбекю", "Напиток", "Напиток", "Горячий напиток", "Горячий напиток", "Горячий напиток",]
    static var price = ["2600", "2700", "2200", "2300", "2900", "2100", "3400", "500", "600", "900", "950", "990"]
    static var size = ["Большая", "Средняя", "Маленькая"]
    static var ingredients = ["ingredient1", "ingredient2", "ingredient3", "ingredient4", "ingredient5", "ingredient6", "ingredient7"]
    
    static var drinks = ["drink1", "drink2"]
    static var titleDrinks = ["Напиток 7UP", "Напиток Mirinda"]
    static var descriptionDrinks = ["Напиток", "Напиток"]
    static var priceDrinks = ["500", "600"]
    
    static var coffee = ["coffee1", "coffee2", "coffee3"]
    static var titleCoffee = ["Кофе Американо", "Кофе Капучино", "Кофе Мокка"]
    static var descriptionCoffee = ["Горячий напиток - Американо. Кофе и вода", "Горячий напиток - Капучино. Кофе, кокосовое молоко и вода", "Горячий напиток - Мокка. Кофе, шоколад и вода"]
    static var priceCoffee = ["900", "950", "990"]
    
}
