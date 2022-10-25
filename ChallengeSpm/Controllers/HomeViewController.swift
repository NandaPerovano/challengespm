//
//  HomeViewController.swift
//  ChallengeSpm
//
//  Created by Fernanda Perovano on 25/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: PROPERTIES
    lazy var favoriteBooksCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .systemGray6
        cv.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: "BooksCollectionViewCell")
        return cv
    }()
    
    lazy var favoriteAuthorCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .red
        cv.register(AuthorCollectionViewCell.self, forCellWithReuseIdentifier: "AuthorCollectionViewCell")
        return cv
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        view.clipsToBounds = true
        view.layer.masksToBounds =  true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.boldSystemFont(ofSize: 33)
        label.text = "SSBOOK"
        return label
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuarioLogado")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        return image
    }()
    
    lazy var booksSegmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl()
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.insertSegment(withTitle: "Meus Livros", at: 0, animated: true)
        segmented.insertSegment(withTitle: "Favoritos", at: 0, animated: true)
        segmented.selectedSegmentIndex = 0
        segmented.backgroundColor = .clear
        segmented.tintColor = .clear
        segmented.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "DINcondensed-Bold", size: 18) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmented.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "DINcondensed-Bold", size: 18) as Any, NSAttributedString.Key.foregroundColor: UIColor.purple], for: .selected)
        return segmented
    }()
    
    lazy var favoriteBooksLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Livros favoritos"
        return label
    }()
    
    lazy var seeFavotiteBooksButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ver todos", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.purple, for: .normal)
        return button
    }()
    
    lazy var baseBoardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var favotiteAuthorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Autores Favoritos"
        return label
    }()
    
    lazy var seeFavotiteAuthorsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ver todos", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.purple, for: .normal)
        return button
    }()
    
    lazy var libraryLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Biblioteca"
        return label
    }()
    
    lazy var bookCategorySegmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl()
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.insertSegment(withTitle: "Todos", at: 0, animated: true)
        segmented.insertSegment(withTitle: "Romance", at: 0, animated: true)
        segmented.insertSegment(withTitle: "Aventura", at: 0, animated: true)
        segmented.insertSegment(withTitle: "Comédia", at: 0, animated: true)
        segmented.selectedSegmentIndex = 0
        segmented.backgroundColor = .clear
        segmented.tintColor = .clear
        segmented.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "DINcondensed-Bold", size: 18) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmented.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "DINcondensed-Bold", size: 18) as Any, NSAttributedString.Key.foregroundColor: UIColor.purple], for: .selected)
        return segmented
    }()
    
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.setupUi()
        changeTitleLabel()
        layoutFavoriteBooksCollectionView()
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        self.favoriteBooksCollectionView.collectionViewLayout = layout
//        self.favoriteBooksCollectionView.dataSource = self
        
    }
    
    // MARK: SETUP UI CONSTRAINTS
    private func setupUi() {
        view.addSubview(headerView)
        view.addSubview(titleLabel)
        view.addSubview(userImageView)
        view.addSubview(booksSegmentedControl)
        view.addSubview(favoriteBooksLabel)
        view.addSubview(seeFavotiteBooksButton)
        view.addSubview(favoriteBooksCollectionView)
        view.addSubview(baseBoardView)
        view.addSubview(favotiteAuthorsLabel)
        view.addSubview(seeFavotiteAuthorsButton)
        //view.addSubview(favoriteAuthorCollectionView)
        view.addSubview(libraryLabel)
        view.addSubview(bookCategorySegmentedControl)
        
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 44),
            
            self.userImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
            self.userImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.userImageView.heightAnchor.constraint(equalToConstant: 32),
            self.userImageView.widthAnchor.constraint(equalToConstant: 32),
            
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 128),
            
            self.booksSegmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 96),
            self.booksSegmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 31),
            
            self.favoriteBooksLabel.topAnchor.constraint(equalTo: booksSegmentedControl.bottomAnchor, constant: 32),
            self.favoriteBooksLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.favoriteBooksLabel.heightAnchor.constraint(equalToConstant: 23),
            
            self.seeFavotiteBooksButton.topAnchor.constraint(equalTo: booksSegmentedControl.bottomAnchor, constant: 36),
            self.seeFavotiteBooksButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.seeFavotiteBooksButton.heightAnchor.constraint(equalToConstant: 16),
            
            self.favoriteBooksCollectionView.topAnchor.constraint(equalTo: favoriteBooksLabel.topAnchor, constant: 40),
            self.favoriteBooksCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.favoriteBooksCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.favoriteBooksCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            self.baseBoardView.topAnchor.constraint(equalTo: favoriteBooksCollectionView.bottomAnchor, constant: 32),
            self.baseBoardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.baseBoardView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.baseBoardView.heightAnchor.constraint(equalToConstant: 787),
            
            self.favotiteAuthorsLabel.topAnchor.constraint(equalTo: self.baseBoardView.topAnchor, constant: 32),
            self.favotiteAuthorsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.favotiteAuthorsLabel.heightAnchor.constraint(equalToConstant: 23),
            
            self.seeFavotiteAuthorsButton.topAnchor.constraint(equalTo: baseBoardView.topAnchor, constant: 36),
            self.seeFavotiteAuthorsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.seeFavotiteAuthorsButton.heightAnchor.constraint(equalToConstant: 16),
            
//            self.favoriteAuthorCollectionView.topAnchor.constraint(equalTo: favotiteAuthorsLabel.topAnchor, constant: 22),
//            self.favoriteAuthorCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//            self.favoriteAuthorCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
//            self.favoriteAuthorCollectionView.heightAnchor.constraint(equalToConstant: 67),
            
            self.libraryLabel.topAnchor.constraint(equalTo: self.baseBoardView.topAnchor, constant: 120),
            self.libraryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.libraryLabel.heightAnchor.constraint(equalToConstant: 23),
            
            self.bookCategorySegmentedControl.topAnchor.constraint(equalTo: self.libraryLabel.bottomAnchor, constant: 16),
            self.bookCategorySegmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
        
    }

    // MARK: METHODOS
    
    func changeTitleLabel() {
        let mytitleLabel: NSString = "SSBOOK"
        var chanceMyTitleLabel = NSMutableAttributedString()
        chanceMyTitleLabel = NSMutableAttributedString(string: mytitleLabel as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        chanceMyTitleLabel.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:0,length:2))
        titleLabel.attributedText = chanceMyTitleLabel
    }
    
    func  layoutFavoriteBooksCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.favoriteBooksCollectionView.collectionViewLayout = layout
        self.favoriteBooksCollectionView.dataSource = self
    }
    
    
    func  layoutFavoriteAuthorCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.favoriteBooksCollectionView.collectionViewLayout = layout
        self.favoriteBooksCollectionView.dataSource = self
    }
}

// MARK: DATA SOURCE
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == self.collectionViewA {
//            return 0 // Replace with count of your data for collectionViewA
//        }
//
//        return 0 // Replace with count of your data for collectionViewB
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.cellIdentifier, for: indexPath) as? BooksCollectionViewCell else { fatalError("Cell not found") }
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        if collectionView == self.collectionViewA {
//            let cellA = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewAIdentifier) as UICollectionViewCell
//
//            // Set up cell
//            return cellA
//        }
//
//        else {
//            let cellB = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewBIdentifier) as UICollectionViewCell
//
//            // ...Set up cell
//
//            return cellB
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return  CGSize(width: 100, height: 200)
        //return  CGSize(width: self.view.frame.size.width/3, height: self.view.frame.size.height/4)
    }
    
}
