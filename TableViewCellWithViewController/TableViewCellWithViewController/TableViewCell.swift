//
//  TableViewCell.swift
//  TableViewCellWithViewController
//
//  Created by Gopakumar MP on 3/7/19.
//  Copyright © 2019 Gopakumar MP. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    static let reuseIdentifier = "TableViewCellIdentifier"
    
    // MARK: - HostedView
    var hostedView: UIView? {
        didSet {
            guard let hostedView = hostedView else {
                return
            }
            
            hostedView.frame = contentView.bounds
            contentView.addSubview(hostedView)
        }
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        if hostedView?.superview == contentView {
            hostedView?.removeFromSuperview()
        } else {
            print("")
        }
        
        hostedView = nil
    }
}
