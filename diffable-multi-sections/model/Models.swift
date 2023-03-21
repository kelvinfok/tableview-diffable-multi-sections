//
//  Models.swift
//  diffable-multi-sections
//
//  Created by Kelvin Fok on 20/3/23.
//

import Foundation

enum Row: Hashable {
  case product(ProductModel)
  case payment(PaymentModel)
  case gift(GiftModel)
}

struct ProductModel: Hashable {
  let image: String
  let name: String
  let price: String
  
  static let all: [Self] = [.playstationControl, .xbox, .nintendoSwitch]
  
  static let playstationControl: Self = .init(
    image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/HPNG2?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1665002952548",
    name: "Playstation control",
    price: "$199")
  
  static let xbox: Self = .init(
    image: "https://cdn.shopify.com/s/files/1/0036/4806/1509/products/3872ba156d5595dad2c8c39ea1086a6fdf8c40c3_square2993231_1_1000x.jpg?v=1676652025",
    name: "XBox",
    price: "$569")
  
  static let nintendoSwitch: Self = .init(
    image: "https://cdn.shopify.com/s/files/1/0972/9804/products/7_81b4007b-5980-49b6-b623-11e4be62d7ed.jpg?v=1591062593",
    name: "Nintendo Switch",
    price: "$455")
}

struct PaymentModel: Hashable {
  let image: String
  let name: String
  
  static let visa: Self = .init(
    image: "https://lavca.org/app/uploads/2019/07/VISA-logo-square.png",
    name: "Visa")
  
  static let master: Self = .init(
    image: "https://static.dezeen.com/uploads/2016/07/mastercard-logo-redesign-pentagram-square_dezeen_936_0.jpg",
    name: "Master")
  
  static let bitcoin: Self = .init(
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png",
    name: "Bitcoin")
  
  static let grabPay: Self = .init(
    image: "https://assets.grab.com/wp-content/uploads/sites/8/2021/11/26235239/GrabPay_Final_Logo_RGB_green_StackedVersion-01.png",
    name: "GrabPay")
  
  static let paypal: Self = .init(
    image: "https://www.freepnglogos.com/uploads/paypal-logo-png-2.png",
    name: "Paypal")
}

struct GiftModel: Hashable {
  let image: String
  let name: String
  
  static let netflix: Self = .init(
    image: "https://www.citypng.com/public/uploads/preview/-11594687246vzsjesy7bd.png",
    name: "Netflix 90 days trial")
  
  static let disneyPlus: Self = .init(
    image: "https://m.media-amazon.com/images/I/712ui3rj1RL.png",
    name: "Disney Plus unlimited access")
  
  static let nortonAntivirus: Self = .init(
    image: "https://now.symassets.com/content/dam/norton/global/images/non-product/logos/norton_logo.png",
    name: "Norton Antivirus Mac 90 days trial")
  
  static let teslaExtendedWarranty: Self = .init(
    image: "https://oceansquare.com/wp-content/uploads/2018/04/tesla-logo-500.jpg",
    name: "Tesla Extended Warranty")
}
