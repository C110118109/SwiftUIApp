//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct Product {
    let name: String
    let description: String
    let price: Int64
    let rating: Double
    let ingredients: String
    let imageName: String
}

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    
    let products: [Product] = [
        Product(name: "超頂豬肉漢堡", description: "我是好吃的豬肉漢堡", price: 45, rating: 4.9, ingredients: "豬肉+生菜＋小黃瓜", imageName: "hamburger_1"),
        Product(name: "金黃炸雞堡", description: "我是美味的雞排漢堡", price: 50, rating: 4.8, ingredients: "雞排+番茄＋美奶滋", imageName: "hamburger_2"),
        Product(name: "豬排霸霸堡", description: "我是多汁的牛肉漢堡", price: 60, rating: 5.0, ingredients: "牛肉+洋蔥＋生菜", imageName: "hamburger_3"),
        Product(name: "起司狂潮堡", description: "我是爆漿起司漢堡", price: 45, rating: 4.7, ingredients: "起司+生菜", imageName: "hamburger_4"),
        Product(name: "海味鮪魚堡", description: "我是好吃鮪魚漢堡", price: 45, rating: 4.7, ingredients: "鮪魚+洋蔥＋生菜", imageName: "hamburger_5"),
        Product(name: "綠意森林堡", description: "我是健康到只有菜漢堡", price: 40, rating: 4.7, ingredients: "小黃瓜+生菜＋番茄", imageName: "hamburger_6"),
        Product(name: "海風蝦餅堡", description: "我是蝦餅漢堡", price: 70, rating: 4.7, ingredients: "蝦餅+生菜", imageName: "hamburger_7"),
        //----------------------
        Product(name: "黃金玉米蛋吐司", description: "金黃玉米與雞蛋的搭配，營養又美味。", price: 40, rating: 4.8, ingredients: "玉米+雞蛋+小黃瓜+生菜", imageName: "toast_6"),
        Product(name: "雙煎培根蛋吐司", description: "雙層煎培根與雞蛋，搭配新鮮生菜，簡單卻不平凡。", price: 45, rating: 4.9, ingredients: "培根+雞蛋+生菜", imageName: "toast_1"),
        Product(name: "太陽煎蛋吐司", description: "", price: 35, rating: 4.8, ingredients: "雞蛋+肉鬆+生菜", imageName: "toast_5"),
        Product(name: "薯香蛋泥吐司", description: "", price: 45, rating: 5.0, ingredients: "薯泥+蛋+生菜", imageName: "toast_3"),
        Product(name: "海洋鮪魚吐司", description: "", price: 45, rating: 4.8, ingredients: "鮪魚+洋蔥+生菜", imageName: "toast_2"),
        Product(name: "金脆雞排吐司", description: "", price: 60, rating: 4.9, ingredients: "雞排+起司+生菜", imageName: "toast_4"),
        //-----------------------
        
        Product(name: "九層塔香蛋餅", description: "九層塔的香氣完美融入蛋餅，帶來濃郁風味。", price: 35, rating: 5.0, ingredients: "九層塔", imageName: "eggCake_3"),
        Product(name: "肉鬆香脆蛋餅", description: "酥脆蛋餅皮包裹著香甜肉鬆，口感層次分明。", price: 35, rating: 4.8, ingredients: "肉鬆", imageName: "eggCake_1"),
        Product(name: "原味經典蛋餅", description: "", price: 30, rating: 4.7, ingredients: "無", imageName: "eggCake_4"),
        Product(name: "起司熔岩蛋餅", description: "", price: 40, rating: 4.9, ingredients: "起司", imageName: "eggCake_5"),
        Product(name: "培根脆餅", description: "", price: 40, rating: 4.9, ingredients: "培根", imageName: "eggCake_2"),
        Product(name: "熱狗狂熱蛋餅", description: "", price: 40, rating: 4.8, ingredients: "熱狗", imageName: "eggCake_6"),
        //-----------------------
        Product(name: "奶茶", description: "經典台式奶茶，口感香醇濃郁。", price: 25, rating: 4.9, ingredients: "紅茶+牛奶", imageName: "drink_1"),
        Product(name: "豆漿", description: "傳統風味的豆漿，健康又營養。", price: 20, rating: 4.8, ingredients: "黃豆", imageName: "drink_2"),
        Product(name: "紅茶", description: "", price: 20, rating: 4.8, ingredients: "紅茶", imageName: "drink_3"),
        Product(name: "柳橙汁", description: "", price: 25, rating: 4.7, ingredients: "柳橙", imageName: "drink_4")

    ]

    private let categories = ["全部", "漢堡", "吐司", "蛋餅", "飲料"]
    
    // filteredProducts 計算屬性
    var filteredProducts: [Product] {
        if selectedIndex == 0 {
            return products // 全部顯示
        } else {
            let category = categories[selectedIndex]
            return products.filter { product in
                switch category {
                case "漢堡":
                    return product.name.contains("堡")
                case "吐司":
                    return product.name.contains("吐司")
                case "蛋餅":
                    return product.name.contains("蛋餅")
                case "飲料":
                    return product.name.contains("奶茶") || product.name.contains("豆漿") ||
                        product.name.contains("紅茶") || product.name.contains("柳橙汁")
                default:
                    return false
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        //Text(categories[selectedIndex])
                            //.font(.custom("PlayfairDisplay-Bold", size: 24))
                            //.padding(.horizontal)
                        
                        if selectedIndex == 0 {
                            ScrollView {
                                VStack(alignment: .leading, spacing: 20) {
                                    ForEach(categories.indices, id: \.self) { index in
                                        if index != 0 { // 避免處理「全部」分類
                                            let category = categories[index]
                                            Text(category)
                                                .font(.custom("PlayfairDisplay-Bold", size: 24))
                                                .padding(.horizontal)
                                            
                                            ScrollView(.horizontal, showsIndicators: false) {
                                                HStack(spacing: 16) {
                                                    ForEach(products.filter { product in
                                                        switch category {
                                                        case "漢堡":
                                                            return product.name.contains("堡")
                                                        case "吐司":
                                                            return product.name.contains("吐司")
                                                        case "蛋餅":
                                                            return product.name.contains("蛋餅")
                                                        case "飲料":
                                                            return product.name.contains("茶") || product.name.contains("豆漿") || product.name.contains("柳橙汁")
                                                        default:
                                                            return false
                                                        }
                                                    }, id: \.name) { product in
                                                        NavigationLink(
                                                            destination: DetailScreen(product: product),
                                                            label: {
                                                                ProductCardView(size: 210, product: product)
                                                            }
                                                        )
                                                        .navigationBarHidden(true)
                                                        .foregroundColor(.black)
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            // 使用水平 ScrollView 顯示其他類別
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(filteredProducts, id: \.name) { product in
                                        NavigationLink(
                                            destination: DetailScreen(product: product),
                                            label: {
                                                ProductCardView(size: 210, product: product)
                                            }
                                        )
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                    }
                                    .padding(.leading)
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    BottomNavBarView()
                }
            }
        }
        
//        .navigationBarTitle("") //this must be empty
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



struct AppBarView: View {
    var body: some View {
        HStack {
//            Button(action: {}) {
//                Image("menu")
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10.0)
//            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Ｗelcome\n")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Bēi & Luna !")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("搜尋餐點", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Search")
                    .padding()
                    .background(Color.white) // 或者 Color("Primary")
                    .cornerRadius(10.0)
                    .foregroundColor(Color.white)
            }

        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    
    let size: CGFloat
    let product: Product
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text(product.name).font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< Int(product.rating),id: \.self) { _ in
                    Image("star")
                }
                Spacer()
                Text("$"+String(product.price))
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}


struct BottomNavBarView: View {
    var body: some View {
        
        HStack {
            BottomNavBarItem(systemImageName: "house", action: { print("主頁按鈕被點擊") })
            //BottomNavBarItem(systemImageName: "heart", action: { print("收藏按鈕被點擊") })
            // 使用 NavigationLink 跳转到购物车页面
            NavigationLink(destination: ShoppingCartView()) {
                Image(systemName: "cart")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 24))
                    .foregroundColor(.gray) // 图标颜色
            }
            //BottomNavBarItem(systemImageName: "person", action: { print("使用者按鈕被點擊") })
        }
        .padding()
        .background(Color.white)	
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}


struct BottomNavBarItem: View {
    let systemImageName: String
    let action: () -> Void
    let color: Color = .gray // 默認顏色
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(color)
                .frame(maxWidth: .infinity)
        }
    }
}

