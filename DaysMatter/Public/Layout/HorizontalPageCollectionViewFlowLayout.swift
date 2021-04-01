//
//  HorizontalPageCollectionViewFlowLayout.swift
//  CiChang
//
//  Created by 郝亚雷 on 2018/6/23.
//  Copyright © 2018年 hujiang. All rights reserved.
//

import Foundation
import UIKit

class HorizontalPageCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var mostRecentOffset: CGPoint = CGPoint()

    override init() {
        super.init()

        self.scrollDirection = .horizontal
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //该方法 适用于 一屏幕一个cell的情况
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        if velocity.x == 0 {
            return mostRecentOffset
        }

        if let cv = self.collectionView {

            let cvBounds = cv.bounds
            let halfWidth = cvBounds.size.width * 0.5;

            if let attributesForVisibleCells = self.layoutAttributesForElements(in: cvBounds) {

                var candidateAttributes: UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells {

                    if attributes.representedElementCategory != UICollectionView.ElementCategory.cell {
                        continue
                    }

                    if (attributes.center.x == 0) || (attributes.center.x > (cv.contentOffset.x + halfWidth) && velocity.x < 0) {
                        continue
                    }
                    candidateAttributes = attributes
                }

                if (proposedContentOffset.x == -(cv.contentInset.left)) {
                    return proposedContentOffset
                }

                guard let _ = candidateAttributes else {
                    return mostRecentOffset
                }
                mostRecentOffset = CGPoint(x: floor(candidateAttributes!.center.x - halfWidth), y: proposedContentOffset.y)
                return mostRecentOffset
            }
        }

        mostRecentOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        return mostRecentOffset
    }
}
