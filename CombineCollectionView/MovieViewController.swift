//
//  MovieViewController.swift
//  CombineCollectionView
//
//  Created by zeroplus on 2020/5/8.
//  Copyright © 2020 zeroplus. All rights reserved.
//

import UIKit
import Combine

class MovieViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var cancellables = Set<AnyCancellable>()
    var datasource: UICollectionViewDiffableDataSource<Int, Feed>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top 100 Movies"

        ThemeManager.shared.themeSubject.sink(receiveValue: { style in
        switch style {
            case .system:
                self.overrideUserInterfaceStyle = .unspecified
            case .dark:
                self.overrideUserInterfaceStyle = .dark
            case .light:
                self.overrideUserInterfaceStyle = .light
            }
        })
        .store(in: &cancellables)
        
        testCollectionView();
        
    }
    
    func testCollectionView() {
        NetworkManager.fetchTopMovies()
            .sink(receiveCompletion: { (completion) in
            // handle completion here
            }, receiveValue: { (movieData) in
                print(movieData)
                self.applySnapshot(movieData.feed.results)
            })
            .store(in: &cancellables)
                
        
        datasource = UICollectionViewDiffableDataSource<Int, Feed>
            .init(collectionView: collectionView) { collectionView, indexPath, item in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

                cell.title.text = item.name
                
                // load image here
                

                return cell
        }
    }
    
    func applySnapshot(_ models: [Feed]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Feed>()
        snapshot.appendSections([0])
        snapshot.appendItems(models)
        
        // send data to datasource
        datasource.apply(snapshot)
    }


}
