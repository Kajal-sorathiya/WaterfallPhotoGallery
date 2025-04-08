//
//  ViewController.swift
//  WaterfallPhotoGallery
//
//  Created by Ahir on 10/12/23.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class ViewController: UIViewController {
    
    private let clView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .shortestFirst
        layout.columnCount = 3
        let collectionview = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionview.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        return collectionview
    }()
    
    private var arrImages = [ImageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(clView)
        setImages()
        clView.delegate = self
        clView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        clView.frame = view.bounds
    }
    
    private func setImages() {
        let arrImgs = [
            "CoconutTreeNature",
            "GreenNature",
            "InsertScreenBGImg",
            "RoadGreenNature",
            "SpringNature",
            "WaterInNature",
            "WaterNature",
            "GreenNature",
            "InsertScreenBGImg",
            "SpringNature",
            "SpringNature",
            "WaterInNature",
            "CoconutTreeNature",
            "RoadGreenNature",
            "SpringNature"
        ]
        arrImages = arrImgs.map {
            ImageModel.init(imgname: $0, height: CGFloat.random(in: 200...300))
        }
        clView.reloadData()
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath)
        if let cell = cell as? ImageCell {
            cell.configure(image: UIImage(named: arrImages[indexPath.row].imgname))
            return cell
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(indexPath.row)
        return CGSize(width: view.frame.size.width / 2, height: arrImages[indexPath.row].height)
    }
    
}
extension ViewController: CHTCollectionViewDelegateWaterfallLayout {
   
}
struct ImageModel {
    let imgname: String
    let height: CGFloat
}
