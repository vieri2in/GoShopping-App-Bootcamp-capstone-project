//
//  ImageView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/1/23.
//

import SwiftUI

struct ImageView: View {
  var imgName: String
  var body: some View {
    Image("\(imgName)")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: Constants.General.imageViewLength, height: Constants.General.imageViewLength)
      .clipped()
  }
}
struct AsyncImageUnitView: View {
  let urlString: String
  var body: some View {
    let url = URL(string: urlString)
    AsyncImage(url: url) { returnedImage in
      returnedImage
        .resizable()
//        .aspectRatio(contentMode: .fit)
        .scaledToFit()
        .frame(maxWidth: Constants.General.imageUnitViewLength,
               maxHeight: Constants.General.imageUnitViewLength)
        .padding(.all, Constants.General.asyncImageUnitVPadding)
        .clipped()
    } placeholder: {
      ProgressView()
    }
  }
}
struct AsyncImageCartUnitView: View {
  let urlString: String
  var body: some View {
    let url = URL(string: urlString)
    AsyncImage(url: url) { returnedImage in
      returnedImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: Constants.General.imageCartUnitViewLength,
               maxHeight: Constants.General.imageCartUnitViewLength)
        .padding(.all, Constants.General.asyncImageCartUnitPadding)
        .clipped()
    } placeholder: {
      ProgressView()
    }
  }
}
struct AsyncThumbNailImageView: View {
  let urlString: String
  var body: some View {
    let url = URL(string: urlString)
    AsyncImage(url: url) { returnedImage in
      returnedImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: Constants.General.imageThumbNailRowViewLength,
               maxHeight: Constants.General.imageThumbNailRowViewLength)
        .padding(5)
        .clipShape(Circle())
        .overlay {
          Circle().stroke(Color.gray, lineWidth: 2)
        }
    } placeholder: {
      ProgressView()
    }
  }
}
struct ButtonImageCartUnitView: View {
  let systemName: String
  var body: some View {
    Image(systemName: systemName)
      .resizable()
      .scaledToFit()
      .frame(width: 10, height: 10)
      .foregroundColor(.black)
      .background(
        RoundedRectangle(cornerRadius: 4)
          .fill(Color(UIColor.lightGray).opacity(0.5))
          .frame(width: 20, height: 20)
      )
  }
}
struct DeleteButtonImageCartUnitView: View {
  var body: some View {
    Text("Delete")
      .font(.caption2)
      .foregroundColor(.black)
      .background(
        RoundedRectangle(cornerRadius: 4)
          .fill(Color(UIColor.lightGray).opacity(0.5))
          .frame(width: 50, height: 20)
      )
  }
}
struct AsyncImageListUnitView: View {
  let urlString: String
  var body: some View {
    let url = URL(string: urlString)
    AsyncImage(url: url) { returnedImage in
      returnedImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .padding(.top, Constants.General.asyncImageUnitVPadding)
        .padding(.horizontal, Constants.General.asyncImageUnitHPadding)
        .clipped()
    } placeholder: {
      ProgressView()
    }
  }
}
struct ImageView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      VStack {
        ImageView(imgName: "CKUnderwear-Image")
        ImageView(imgName: "GooglePixel7-Image")
        ImageView(imgName: "NintendoSwitchMario-Image")
        ImageView(imgName: "JackeryPPSExplorer240-Image")
        AsyncImageListUnitView(urlString: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")
        AsyncImageCartUnitView(urlString: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg")
        AsyncThumbNailImageView(urlString: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg")
        HStack(spacing: 20) {
          ButtonImageCartUnitView(systemName: "plus")
          HStack {
            DeleteButtonImageCartUnitView()
          }
        }
      }
    }
  }
}
