import UIKit
class ImageGridViewController: UIViewController {
    private var collectionView: UICollectionView!
    private var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadImages()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let itemWidth = (view.bounds.width - 30) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        view.addSubview(collectionView)
    }
    
    private func loadImages() {
        // Load 100 images for demonstration
        for i in 1...100 {
            let urlString = "https://picsum.photos/200/200?random=\(i)"
            ImageLoader.shared.loadImage(from: urlString) { image in
                if let image = image {
                    self.images.append(image)
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension ImageGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }
}
