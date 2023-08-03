//
//  SearchBarView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/7/23.
//

import SwiftUI

struct SearchBarView: View {
  @Binding var searchText: String
  @State private var isEditing = false
    var body: some View {
      HStack {
        TextField("Search here...", text: $searchText)
          .padding(15)
          .padding(.horizontal, 25)
          .background(Color(.systemGray6))
          .foregroundColor(.black)
          .cornerRadius(8)
          .overlay {
            HStack {
              Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
              if isEditing {
                Button {
                  searchText = ""
                } label: {
                  Image(systemName: "multiply.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                }

              }
            }
          }
          .onTapGesture {
            isEditing = true
          }
      }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
      SearchBarView(searchText: .constant("Pixel"))
    }
}
