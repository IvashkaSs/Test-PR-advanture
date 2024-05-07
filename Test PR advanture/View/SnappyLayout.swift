//
//  SnappyLayout.swift
//  Test PR advanture
//
//  Created by Miloshevich on 23.10.2023.
//
import UIKit

class SnappyLayout: UICollectionViewFlowLayout {
    let activeDistance: CGFloat = 200
    let zoomFactor: CGFloat = 0.3
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
        setup()
    }
    
    private func setup() {
        scrollDirection = .horizontal
        minimumLineSpacing = 40
    }
    
    private func getCollectionView() -> UICollectionView {
        guard let collectionView = collectionView else { fatalError("CollectionView is not present")  }
        
        return collectionView
    }
    
    override func prepare() {
        let collectionView = getCollectionView()
        let width = collectionView.frame.width * 0.6
        let hight = collectionView.frame.height * 0.6
        itemSize = CGSize(width: width , height: hight)
        
        let verticalInsets = (collectionView.frame.height - collectionView.adjustedContentInset.top - collectionView.adjustedContentInset.bottom - hight) / 2
        let horizontalInsets = (collectionView.frame.width - collectionView.adjustedContentInset.right - collectionView.adjustedContentInset.left - width) / 2
        
        sectionInset = UIEdgeInsets(top: verticalInsets, left: horizontalInsets, bottom: verticalInsets, right: horizontalInsets )
        
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let collectionView = getCollectionView()
        let rectAttributes = super.layoutAttributesForElements(in: rect)!.map { $0.copy() as! UICollectionViewLayoutAttributes }
        let visibleRect =  CGRect(origin: collectionView.contentOffset, size: collectionView.frame.size)
        
        for attributes in rectAttributes  where attributes.frame.intersects(visibleRect) {
            let distance = visibleRect.minX - attributes.center.x
            let normalDistance = distance / activeDistance
            
            if distance.magnitude < activeDistance {
                let zoom = 1 + zoomFactor * (1 - normalDistance.magnitude)
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1)
                attributes.zIndex = Int(zoom.rounded())
            }
        }
        return rectAttributes
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let collectionView = getCollectionView()
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.frame.width, height: collectionView.frame.height)
        
        guard let rectAttributes = super.layoutAttributesForElements(in: targetRect) else { return .zero }
         
        var offsetAjustment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + collectionView.frame.width / 2
        
        for layoutAttributes in rectAttributes {
            let itemHorizontalCenter = layoutAttributes.center.x
            if (itemHorizontalCenter - horizontalCenter).magnitude < offsetAjustment.magnitude {
                offsetAjustment = itemHorizontalCenter - horizontalCenter
                
            }
        }
        return CGPoint(x: proposedContentOffset.x + offsetAjustment, y: proposedContentOffset.y)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let collectionView = getCollectionView()
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView.bounds.size
        
        return context
    }
}
