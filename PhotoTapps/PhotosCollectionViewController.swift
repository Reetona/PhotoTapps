//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Adele Fatkullina on 22.12.2020.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["haru1", "haru2", "haru3", "haru4"]
    
    //кол-во ячеек в ряд
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .vertical
        //delete scroll bar
        collectionView.showsVerticalScrollIndicator = false*/
    }
    
    //передача изображения в другой вью
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.myImageView.image
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.myImageView.image = image
        //cell.backgroundColor = .black
        // Configure the cell
    
        return cell
    }

}



    // MARK: configuration FLOW LAYOUT (настройка ячеек)

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
 //ESTIMATE SIZE to none in size inspector
    //размер ячейки высчитываемое для разных моделей ипхона
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        //занятое табуляцией расстояние между объектами и рамками
        let paddingWith = sectionInserts.left * (itemsPerRow + 1)
        //доступная ширина для ячеек
        let availableWidth = collectionView.frame.width - paddingWith
        //ширина конкретной ячейки
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //отступы для коллекции между секциями
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    //отступы между строками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    //отступы между столбцами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.left
    }
}


