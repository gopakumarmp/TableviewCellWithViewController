//
//  ViewController.swift
//  TableViewCellWithViewController
//
//  Created by Gopakumar MP on 3/7/19.
//  Copyright © 2019 Gopakumar MP. All rights reserved.
//

import UIKit


protocol ColorsDelgate:class {
    func contentSizeChanged(height: CGFloat)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,ColorsDelgate {
    @IBOutlet weak var tableView: UITableView!
    var cellHeight:CGFloat = 180.0
    lazy var childViewController: [ChildViewController] = {
        var childViewControllers = [ChildViewController]()
        for _ in  0...3 {
            let childViewController = ChildViewController.createFromStoryboard()
            childViewController.delegate = self
            addChild(childViewController)
            childViewControllers.append(childViewController)
        }
        return childViewControllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = cellHeight
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vc  = childViewController[indexPath.row]
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier") as? TableViewCell else {
            fatalError("Invalid Cell")
        }
        cell.hostedView = vc.view
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func contentSizeChanged(height: CGFloat) {
        cellHeight = height
        self.tableView.reloadData()
    }
}

