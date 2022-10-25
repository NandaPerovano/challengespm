//
//  BooksCollectionViewCell.swift
//  ChallengeSpm
//
//  Created by Fernanda Perovano on 25/10/22.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    
    // MARK: PROPERTIES
    static let cellIdentifier = "BooksCollectionViewCell"
    lazy var bookImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "oPequenoPríncipe")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleBookLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "O Pequeno Príncipe"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 8)
        label.text = "Antone de Sant-Exupéry"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: INITIALIZERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: SETUP UI CONSTRAINTS
    func setupUi() {
        contentView.backgroundColor = .systemGray6
        addSubview(self.bookImageView)
        addSubview(titleBookLabel)
        addSubview(authorLabel)
        
        
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: topAnchor),
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookImageView.bottomAnchor.constraint(equalTo: titleBookLabel.topAnchor, constant: 10),
            
            titleBookLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor),
            titleBookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            titleBookLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleBookLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            titleBookLabel.heightAnchor.constraint(equalToConstant: 20),
            
            authorLabel.topAnchor.constraint(equalTo: titleBookLabel.bottomAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

