//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 15/2/21.
//

import SwiftUI



struct DetailScreen: View {
    let product: Product

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                //            Product Image
                
                Image(product.imageName)
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView(product:product)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text(product.price)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Text("加入購物車")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct=Product(name: "豬肉漢堡", description: "我是好吃的豬肉漢堡", price: "$40", rating: 4.9 , ingredients: "豬肉＋生菜＋小黃瓜", imageName: "chair_1")
        DetailScreen(product: sampleProduct)
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    let product:Product
    
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
            //                Rating
            HStack (spacing: 4) {
                ForEach(0 ..< Int(product.rating), id: \.self) { _ in
                    Image("star")
                }
                Text("(\(String(format: "%.1f", product.rating))")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("餐點介紹")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(product.description)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("內容物")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text(product.ingredients)
                        .opacity(0.6)
                    
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    //Text("Treatment")
                        //.font(.system(size: 16))
                        //.fontWeight(.semibold)
                    //Text("Jati Wood, Canvas, \nAmazing Love")
                        //.opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            //                Colors and Counter
            HStack {
                VStack (alignment: .leading) {
                    //Text("Colors")
                        //.fontWeight(.semibold)
                    //HStack {
                       // ColorDotView(color: Color.white)
                        //ColorDotView(color: Color.black)
                        //ColorDotView(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                    //}
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    //                        Minus Button
                    Button(action: {}) {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                        
                    }
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("1")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    //                        Plus Button
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                    }
                }
                
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
