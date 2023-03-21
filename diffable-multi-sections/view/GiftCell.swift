//
//  GiftsCell.swift
//  diffable-multi-sections
//
//  Created by Kelvin Fok on 20/3/23.
//

import UIKit

final class GiftCell: UITableViewCell {
  
  @IBOutlet weak var giftImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  func configure(model: GiftModel) {
    giftImageView.sd_setImage(with: .init(string: model.image))
    nameLabel.text = model.name
  }
}
