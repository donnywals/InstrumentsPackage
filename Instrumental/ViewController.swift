//
//  ViewController.swift
//  Instrumental
//
//  Created by Donny Wals on 19/06/2018.
//  Copyright © 2018 BAMTech LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let tableView = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(DemoCell.self, forCellReuseIdentifier: DemoCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor)])

    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1000
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DemoCell.identifier, for: indexPath)
    cell.textLabel?.text = "Cell at \(indexPath)"

    let id = OSSignpostID(log: logger, object: cell)
    os_signpost(type: .begin, log: logger, name: "Parsing", signpostID: id, "Parsing SIZE:%@", "256")

    return cell
  }
}

import os.signpost
let logger = OSLog(subsystem: "com.dw.json", category: "Networking")

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let id = OSSignpostID(log: logger, object: cell)
    os_signpost(type: .end, log: logger, name: "Parsing", signpostID: id, "Parsing done")
    os_signpost(type: .begin, log: logger, name: "Cell Display", signpostID: id, "Show:%{public}@", "\(indexPath.row)")
  }

  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let id = OSSignpostID(log: logger, object: cell)
    os_signpost(type: .end, log: logger, name: "Cell Display", signpostID: id, "End:%{public}@", "\(indexPath.row)")
  }
}

class DemoCell: UITableViewCell {
  static let identifier = "DemoCell"
}

