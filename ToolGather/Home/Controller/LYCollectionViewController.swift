//
//  LYCollectionVIewController.swift
//  ToolGather
//
//  Created by 于浏洋 on 2023/7/28.
//

import Foundation

class LYCollectionViewController : BaseViewController {
    
    lazy var collectionView : UICollectionView = {
        let customLayout = CustomCollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: customLayout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "自定义Collection"
        
        self.view.addSubview(collectionView)
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")

    }
}

extension LYCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 6 // Assuming you have six items in each section (3 small, 3 large)
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
           
           // Customize the cell's appearance based on indexPath here if needed
           cell.layer.borderWidth = 1;
           cell.layer.borderColor = CGColor(gray: 1, alpha: 1)
           let imageView = UIImageView(frame: cell.bounds)
           imageView.image = UIImage(named: "美女图")
           imageView.contentMode = .scaleToFill
           imageView.clipsToBounds = true
           cell.contentView.addSubview(imageView)
           return cell
       }
}
