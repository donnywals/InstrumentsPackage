//
//  ViewController.swift
//  InstrumentingMacOS
//
//  Created by Donny Wals on 25/06/2018.
//  Copyright © 2018 BAMTech LLC. All rights reserved.
//

import Cocoa
import os.signpost

class ViewController: NSViewController {

  var button: NSButton!
  let logger = OSLog(subsystem: "com.dw", category: "demo")
  var count = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    button = NSButton(title: "Start Thing", target: self, action: #selector(didTap))

    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
  }

  @objc func didTap() {
    count += 1

    let signPostID = OSSignpostID(log: logger, object: button)
    os_signpost(type: .begin, log: logger, name: "click", signpostID: signPostID, "Clicked:%{public}@", "\(count)")

    let delay = Double(arc4random_uniform(10))
    DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + delay) {
      os_signpost(type: .begin, log: self.logger, name: "click", signpostID: signPostID, "Ended:%{public}@", "\(delay)")
    }
  }
}

