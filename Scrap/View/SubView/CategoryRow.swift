//
//  CategoryRow.swift
//  Scrap
//
//  Created by 김영선 on 2022/10/23.
//

import SwiftUI

struct CategoryRow: View {
    @Binding var category : CategoryResponse.Category
    @State private var isEditing = false
    @State private var categoryName = "category"
    @Binding var isShowingCateogry : Bool
    @Binding var selected : Int
    @State private var isChangeRow = true
    @EnvironmentObject var vm : ScrapViewModel //여기서 카테고리 추가 post api 보내야되니까 필요
    @EnvironmentObject var userVM : UserViewModel //여기서 로그아웃
    
    var body: some View {
//        if !isEditing { //edit mode가 아닐 때
            HStack{
                HStack{
                    Text(category.name)
                        .font(.system(size: 16))
                        .frame(width: UIScreen.main.bounds.width - 120, alignment: .leading)
                        .foregroundColor(.black)
                    Text("\(category.numOfLink)")
                        .font(.system(size: 16))
                        .frame(width: 30, alignment: .trailing)
                    .foregroundColor(.black)
                }
                .onTapGesture {
                    self.selected = category.categoryId
                    self.isEditing = false //edit mode 아님
                    self.isChangeRow = true
                    UserDefaults(suiteName: "group.com.thk.Scrap")?.set(selected, forKey: "lastCategory") //마지막 카테고리 id 저장
                    print("\(selected) is selected category id")
                    vm.getData(userID: userVM.userIdx, catID: selected, seq: "seq")
                    withAnimation(.easeInOut.delay(0.3)){
                        isShowingCateogry = false
                    }
                }
                //modal shet 등장
                Button(action:{
                    self.isEditing = true //edit mode로 변경
                    self.selected = category.categoryId
                    print("click option button")
                }){
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray_bold)
                }
                .frame(width: 24, height: 32)
            }
            .padding(.leading, 10)
            .listRowBackground(self.selected == category.categoryId ? .gray_sub : Color(.white))
//        }
//        else {
//            HStack{
//                TextField(category.name, text: $category.name)
//                    .font(.system(size: 16))
//                    .frame(width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 2.3), alignment: .leading)
//                Button(action:{
//                    self.isEditing = false //edit mode 종료
//                    //📡 카테고리 이름 수정 서버 통신
//                    vm.modifyCategory(categoryID: userVM.userIdx, categoryName: category.name)
//                    //modify category name in local category list
//                    print("exit edit mode")
//                }){
//                    Image(systemName: "checkmark")
//                        .resizable()
//                        .foregroundColor(.gray_bold)
//                }
//                .frame(width: 18, height: 18)
//            }
//            .padding(.leading, 10)
//            .listRowBackground(self.selected == category.categoryId ? .gray_sub : Color(.white))
//        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: .constant(CategoryResponse.Category(categoryId: 0, name: "name", numOfLink: 10, order: 1)), isShowingCateogry: .constant(true), selected: .constant(0))
    }
}
