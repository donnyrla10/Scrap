//
//  HomeView.swift
//  Scrap
//
//  Created by 김영선 on 2023/02/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var scrapVM : ScrapViewModel
    @EnvironmentObject var userVM : UserViewModel
    @State private var isPresentDataModalSheet = false
    
    @Binding var selectedCategoryID: Int
    @Binding var selectedCategoryOrder: Int
    @Binding var isShowingCategorySideMenuView: Bool

    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    
    var categoryTitle : String { return "\(scrapVM.categoryList.result.categories[scrapVM.categoryList.result.categories.firstIndex(where: {$0.categoryId == selectedCategoryID}) ?? 0].name)"}
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.isShowingCategorySideMenuView = true
                        scrapVM.getCategoryListData(userID: userVM.userIndex)
                    }
                }) {
                    ZStack {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 22, height: 16)
                            .foregroundColor(Color("basic_text"))
                    }
                    .frame(width: 55, height: 40)
                    .padding(.trailing, -10)
                }
                Text(categoryTitle)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("basic_text"))
                    .frame(width: screenWidth / 1.22, alignment: .leading)
                    .padding(.trailing)
                Spacer()
                    .frame(width: 5)
            }
            .frame(width: screenWidth, height: 40)
            SubHomeView(datas: $scrapVM.dataList, isPresentDataModalSheet: $isPresentDataModalSheet, currentCategoryId: $selectedCategoryID, currentCategoryOrder: $selectedCategoryOrder)
                .navigationBarTitle("", displayMode: .inline)
        }
        if isPresentDataModalSheet {
            Color(.black)
                .opacity(0.2)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresentDataModalSheet = false
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedCategoryID: .constant(0), selectedCategoryOrder: .constant(0), isShowingCategorySideMenuView: .constant(false))
            .environmentObject(ScrapViewModel())
            .environmentObject(UserViewModel())
    }
}
