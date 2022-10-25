//
//  AuthorCollectionViewCell.swift
//  ChallengeSpm
//
//  Created by Fernanda Perovano on 25/10/22.
//

import UIKit

class AuthorCollectionViewCell: UICollectionViewCell {

        // MARK: PROPERTIES
        static let cellIdentifier = "AuthorCollectionViewCell"
    
        lazy var authorImageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "oPequenoPríncipe")
            image.contentMode = .scaleAspectFit
            return image
        }()
        
        lazy var authorLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.text = "O Pequeno Príncipe"
            return label
        }()
        
        lazy var numberOfBooks: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = .systemFont(ofSize: 14)
            label.text = "6 livros"
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
            addSubview(authorImageView)
            addSubview(authorLabel)
            addSubview(numberOfBooks)
            
            NSLayoutConstraint.activate([
                
                authorImageView.topAnchor.constraint(equalTo: topAnchor),
                authorImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                authorImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                authorImageView.heightAnchor.constraint(equalToConstant: 67),
                
                authorLabel.topAnchor.constraint(equalTo: authorImageView.bottomAnchor, constant: 10),
                authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                authorLabel.heightAnchor.constraint(equalToConstant: 18),
                
                numberOfBooks.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 2),
                numberOfBooks.leadingAnchor.constraint(equalTo: leadingAnchor),
                numberOfBooks.trailingAnchor.constraint(equalTo: trailingAnchor),
                numberOfBooks.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }

