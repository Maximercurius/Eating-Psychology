//
//  FoodCell.swift
//  Eating Psychology
//
//  Created by Makarov_Maxim on 10.10.2022.
//

import UIKit

class FoodCell: UICollectionViewCell {
    static let reuseID = "FoodCell"
    
    let foodImageView = EPImageView(frame: .zero)
    let foodNameLabel = EPTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(foodAdviceItem: Item) {
        foodNameLabel.text = foodAdviceItem.title

    }
    
    private func configure() {
        addSubview(foodImageView)
        addSubview(foodNameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            foodImageView.heightAnchor.constraint(equalTo: foodImageView.widthAnchor),
            
            foodNameLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 12),
            foodNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            foodNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
