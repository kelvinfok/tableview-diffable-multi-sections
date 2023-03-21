//
//  PaymentCell.swift
//  diffable-multi-sections
//
//  Created by Kelvin Fok on 20/3/23.
//

import UIKit

final class PaymentCell: UITableViewCell {
  
  @IBOutlet weak var paymentImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  func configure(model: PaymentModel) {
    paymentImageView.sd_setImage(with: .init(string: model.image))
    nameLabel.text = model.name
  }
  
}
