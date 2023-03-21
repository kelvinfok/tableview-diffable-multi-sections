//
//  ViewController.swift
//  diffable-multi-sections
//
//  Created by Kelvin Fok on 20/3/23.
//

import UIKit

class DataSource: UITableViewDiffableDataSource<TableViewController.Section, Row> {
  
  init(tableView: UITableView) {
    super.init(tableView: tableView) { tableView, indexPath, item in
      switch item {
      case .product(let model):
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCellId", for: indexPath) as! ProductCell
        cell.configure(model: model)
        return cell
      case .payment(let model):
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCellId", for: indexPath) as! PaymentCell
        cell.configure(model: model)
        return cell
      case .gift(let model):
        let cell = tableView.dequeueReusableCell(withIdentifier: "giftCellId", for: indexPath) as! GiftCell
        cell.configure(model: model)
        return cell
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let header = TableViewController.Section.allCases[section]
    switch header {
    case .product:
      return "Products"
    case .payment:
      return "Supported payments"
    case .gift:
      return "Gifts for your purchase"
    }
  }
}

class TableViewController: UITableViewController {
  
  private var products: [Row] = []
  private var payments: [Row] = []
  private var gifts: [Row] = []
  
  private lazy var dataSource = DataSource(tableView: tableView)
  
  enum Section: String, CaseIterable {
    case product
    case payment
    case gift
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.products = ProductModel.all.map { .product($0) }
    applySnapshot()
  }
  
  private func applySnapshot() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()
    snapshot.appendSections([.product, .payment, .gift])
    snapshot.appendItems(products, toSection: .product)
    snapshot.appendItems(payments, toSection: .payment)
    snapshot.appendItems(gifts, toSection: .gift)
    dataSource.apply(snapshot, animatingDifferences: true)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let item: Row = dataSource.itemIdentifier(for: indexPath) else { return }
    switch item {
    case .product(let model):
      self.gifts = []
      switch model {
      case .nintendoSwitch:
        self.payments = [
          PaymentModel.bitcoin,
          PaymentModel.visa,
          PaymentModel.master
        ].map { .payment($0) }
      case .xbox:
        self.payments = [
          PaymentModel.visa,
          PaymentModel.paypal,
          PaymentModel.grabPay
        ].map { .payment($0) }
      default:
        self.payments = [
          PaymentModel.master,
          PaymentModel.visa,
          PaymentModel.bitcoin,
          PaymentModel.grabPay
        ].map { .payment($0) }
      }
    case .payment(let model):
      switch model {
      case .paypal, .master:
        self.gifts = [
          GiftModel.netflix,
        ].map { .gift($0) }
      case .bitcoin:
        self.gifts = [
          GiftModel.nortonAntivirus,
        ].map { .gift($0) }
      case .grabPay:
        self.gifts = [
          GiftModel.teslaExtendedWarranty,
        ].map { .gift($0) }
      default:
        self.gifts = [
          GiftModel.disneyPlus,
        ].map { .gift($0) }
      }
    default: break
    }
    applySnapshot()
  }
  
  @IBAction func resetButtonTapped(_ sender: UIBarButtonItem) {
    self.payments = []
    self.gifts = []
    applySnapshot()
  }
}
