import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
        let itemWidth = availableWidth / 3
        
        itemSize = CGSize(width: itemWidth, height: itemWidth)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let _ = collectionView, let attributesArray = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        var newAttributesArray = [UICollectionViewLayoutAttributes]()
        
        for attributes in attributesArray {
            let indexPath = attributes.indexPath
            
            let row = indexPath.item / 3
            // Calculate the x-position for the cell based on its position in the row
            var newX: CGFloat = 0
            if row % 2 == 0 {
                if indexPath.item % 3 == 0 {
                    // Left large cell
                    newX = attributes.frame.origin.x
                    let newY = attributes.frame.origin.y + itemSize.height * (floor(CGFloat(indexPath.item) / 3.0))
                    attributes.frame.origin.y = newY
                    attributes.frame.size.width = itemSize.width * 2
                    attributes.frame.size.height = itemSize.height * 2
                } else if indexPath.item % 3 == 1 {
                    // Right top small cell
                    newX = attributes.frame.origin.x + itemSize.width
                    let newY = attributes.frame.origin.y + itemSize.height * (floor(CGFloat(indexPath.item) / 3.0))
                    attributes.frame.origin.y = newY
                    attributes.frame.size.width = itemSize.width
                    attributes.frame.size.height = itemSize.height
                } else if indexPath.item % 3 == 2 {
                    // Right bottom small cell
                    newX = attributes.frame.origin.x
                    let newY = attributes.frame.origin.y + itemSize.height * (floor(CGFloat(indexPath.item) / 3.0))  + itemSize.height
                    attributes.frame.origin.y = newY
                    attributes.frame.size.width = itemSize.width
                    attributes.frame.size.height = itemSize.height
                }
            }else{
                if indexPath.item % 3 == 0 {
                    // Left top small cell
                    newX = attributes.frame.origin.x
                    let newY = attributes.frame.origin.y + itemSize.height * (floor(CGFloat(indexPath.item) / 3.0))
                    attributes.frame.origin.y = newY
                    attributes.frame.size.width = itemSize.width
                    attributes.frame.size.height = itemSize.height
                } else if indexPath.item % 3 == 1 {
                    // left bottom small cell
                    newX = attributes.frame.origin.x - itemSize.width
                    let newY = attributes.frame.origin.y + itemSize.height * (floor(CGFloat(indexPath.item) / 3.0))  + itemSize.height
                    attributes.frame.origin.y = newY
                    attributes.frame.size.width = itemSize.width
                    attributes.frame.size.height = itemSize.height
                } else if indexPath.item % 3 == 2 {
                    // Right large cell
                    newX = attributes.frame.origin.x - itemSize.width
                    let newY = attributes.frame.origin.y + itemSize.height * (floor(CGFloat(indexPath.item) / 3.0))
                    attributes.frame.origin.y = newY
                    attributes.frame.size.width = itemSize.width * 2
                    attributes.frame.size.height = itemSize.height * 2
                    
                }
            }
            
            attributes.frame.origin.x = newX
            
            newAttributesArray.append(attributes)
        }
        
        return newAttributesArray
    }
}
