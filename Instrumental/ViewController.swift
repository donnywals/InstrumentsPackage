//
//  ViewController.swift
//  Instrumental
//
//  Created by Donny Wals on 19/06/2018.
//  Copyright © 2018 BAMTech LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  static let logger = OSLog(subsystem: "com.dw", category: "Behavior")
  static let id = OSSignpostID(log: ViewController.logger, object: self as AnyObject)
    
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
    
    return cell
  }
}

import os.signpost

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        os_signpost(.begin, log: ViewController.logger, name: "Click", signpostID: ViewController.id, "Clicked at: %i", indexPath.row)
        os_signpost(.end, log: ViewController.logger, name: "Click", signpostID: ViewController.id, "Clicked at: %i", indexPath.row)
    }
}

class DemoCell: UITableViewCell {
  static let identifier = "DemoCell"
}

