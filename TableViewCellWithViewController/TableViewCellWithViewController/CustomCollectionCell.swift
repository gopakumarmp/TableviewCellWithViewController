//
//  CustomCollectionCell.swift
//  TableViewCellWithViewController
//
//  Created by Gopakumar MP on 3/7/19.
//  Copyright © 2019 Gopakumar MP. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    func heightForLabel() ->CGFloat {
        let height1 =   self.heightForLabel(withConstrainedWidth: 300, font: UIFont.preferredFont(forTextStyle: .body), text: self.label1.text ?? "")
        let height2 =    self.heightForLabel(withConstrainedWidth: 300, font: UIFont.preferredFont(forTextStyle: .body), text: self.label2.text ?? "")
        let height3 =   self.heightForLabel(withConstrainedWidth: 300, font: UIFont.preferredFont(forTextStyle: .body), text: self.label3.text ?? "")
        return height1 + height2 + height3 + 10.0 + 20.0 + 20.0 + 20.0 + 10.0 + 50
    }
    
    func heightForLabel(withConstrainedWidth width: CGFloat, font: UIFont, text: String) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}
