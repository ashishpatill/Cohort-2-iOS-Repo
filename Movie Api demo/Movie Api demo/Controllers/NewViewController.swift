//
//  NewViewController.swift
//  Movie Api demo
//
//  Created by Ashish Pisey on 20/12/21.
//

import UIKit
import Kingfisher

class NewViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    var photosArr: [Photo] = []
    let photosApi = "https://jsonplaceholder.typicode.com/photos"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        getPhotosApi()
    }
    
    func getPhotosApi() {
        ApiManager.getApiResponse(urlPath: photosApi) { data, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let data = data,
                   let photos = self.parseLogic(data: data) {
                    self.photosArr = photos
                    DispatchQueue.main.async {
                        self.photoCollectionView.reloadData()
                    }
                }
            }
        }
    }
    
    private func parseLogic(data:Data) -> [Photo]? {
        do {
            let photosArr = try JSONDecoder().decode([Photo].self, from: data)
            print(photosArr.first?.title)
            return photosArr
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

extension NewViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! CustomCollectionCell
        let photo = photosArr[indexPath.item]
        cell.lblName.text = photo.title
        if let url = URL.init(string:photo.thumbnailUrl) {
            cell.ImgView.kf.setImage(with: url)
        }
        
        return cell
    }
}


