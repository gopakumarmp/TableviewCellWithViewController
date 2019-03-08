//
//  ChildViewController.swift
//  TableViewCellWithViewController
//
//  Created by Gopakumar MP on 3/7/19.
//  Copyright © 2019 Gopakumar MP. All rights reserved.
//

import UIKit


class ChildViewController : UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    static let storyboardIdentifier = "ChildControllerID"
    weak var delegate:ColorsDelgate?
    
    var cellheight:CGFloat = 180
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.didChangePreferredContentSize), name:
           UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        adjustCollectionViewHeight()
    }
    
    // Storyboard
    
    @objc func didChangePreferredContentSize() {
        self.adjustCollectionViewHeight()
    }
    
    func adjustCollectionViewHeight() {
        
        let cell  = self.collectionView.cellForItem(at: IndexPath(item: 0, section: 0))
        
        if let collectionCell = cell as? CustomCollectionCell {
            let height  = collectionCell.heightForLabel()
            cellheight = height
            if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.invalidateLayout()
            }
            self.delegate?.contentSizeChanged(height: height)
        }
    }
    
    static func createFromStoryboard() -> ChildViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ChildViewController.self))
        guard let viewController = storyboard.instantiateViewController(withIdentifier: ChildViewController.storyboardIdentifier) as? ChildViewController else {
            fatalError("ChildViewController should be present in storyboard")
        }
        
        return viewController
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! CustomCollectionCell
        cell.label1.text = "This is a test for"
        cell.label2.text = "Larggggggggggggggggggggggge"
        cell.label3.text = "Strinnnnnnnnnnnnnnnnnnnnnng"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:"CellID", for: indexPath)
        return CGSize(width: cell.contentView.bounds.size.width, height: cellheight)
    }
}

