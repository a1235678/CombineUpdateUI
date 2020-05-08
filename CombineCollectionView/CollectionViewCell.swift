//
//  CollectionViewCell.swift
//  CombineCollectionView
//
//  Created by zeroplus on 2020/5/7.
//  Copyright © 2020 zeroplus. All rights reserved.
//

import UIKit
import Combine

class CollectionViewCell: UICollectionViewCell {

    var cancellable: Cancellable?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        title.text = nil
    }

}
