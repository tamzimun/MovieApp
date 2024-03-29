//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by tamzimun on 25.05.2022.
//

import UIKit

typealias CallBack = () -> Void
typealias CollectionViewMovie = (Int) -> Void

class MovieTableViewCell: UITableViewCell {
    
    static var identifier = "MovieTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBAction func allButton(_ sender: UIButton) {
        onAllMoviesButtonDidTap?()
    }
    
    var onAllMoviesButtonDidTap: CallBack?
    var onMovieCollectionViewDidTap: CollectionViewMovie?
    
    private var genres: [Genre] = []
    
    private var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: Bundle(for: MovieCollectionViewCell.self)), forCellWithReuseIdentifier: "MovieCollectionViewCell")
    }
    
    func configure(with viewModel: (title: String?, movies: [Movie], genres: [Genre]) ) {
        self.titleLabel.text = viewModel.title
        self.movies = viewModel.movies
        self.genres = viewModel.genres
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
}

extension MovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.configure(with: movies[indexPath.item], genres: genres)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 128, height: 285)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onMovieCollectionViewDidTap?(indexPath.row)
    }
}
