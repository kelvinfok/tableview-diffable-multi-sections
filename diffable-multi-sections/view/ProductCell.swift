//
//  ProductCell.swift
//  diffable-multi-sections
//
//  Created by Kelvin Fok on 20/3/23.
//

import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
  func configure(model: ProductModel) {
    productImageView.sd_setImage(with: .init(string: model.image))
    nameLabel.text = model.name
    priceLabel.text = model.price
  }
}
