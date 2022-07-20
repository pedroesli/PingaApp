import SwiftUI

struct DrinkCategoryView: View {
    let title: String
    @Binding var drinks: [DrinkLite]
    
    var body: some View {
        VStack {
            Text(title)
                //.multilineTextAlignment(.trailing)
                .frame(width: UIScreen.main.bounds.size.width / 1.1, height: 25, alignment: .leading)
                .font(.system(size: 24.0, weight: .bold, design: .rounded))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(drinks, id: \.idDrink) { drink in
                        DrinkModule(drink: drink)
                    }
                }
                .padding(.horizontal, 10)
            }
            //.background(Color(UIColor.lightGray))
        }
        .padding(.top, 20)
    }
}

struct DrinkCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let drinks = [
            DrinkLite(idDrink: "14133", strDrink: "Cosmopolitan Martini", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/upxxpq1439907580.jpg"),
            DrinkLite(idDrink: "14133", strDrink: "Cosmopolitan Martini", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/upxxpq1439907580.jpg")
        ]
        DrinkCategoryView(title: "Non-Alcoholic Drinks", drinks: .constant(drinks))
    }
}
