//
//  PlayingCardView.h
//  superCard
//
//  Created by epeuva on 24/07/2018
//  Copyright © 2018 epeuva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceup;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
