//
//  CustomCollectionViewCell.swift
//  CollectionViewGradientSample
//
//  Created by Payal Gupta on 13/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell
{
    //MARK: Outlets
    @IBOutlet weak var customLabel: UILabel!
    
    //MARK: Private Methods
    private lazy var gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        return gradientLayer
    }()

    //MARK: View Lifecycle Methods
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.customLabel.text = nil
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.layer.insertSublayer(self.gradient, at: 0)
            }
            else
            {
                self.gradient.removeFromSuperlayer()
            }
        }
    }
}
