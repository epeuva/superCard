//
//  PlayingCardView.m
//  superCard
//
//  Created by epeuva on 24/07/2018
//  Copyright © 2018 epeuva. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

#pragma mark - Properties

- (void) setSuit:(NSString *)suit {
    _suit = suit;
    [self setNeedsDisplay];
}

- (void) setRank:(NSUInteger)rank {
    _rank = rank;
    [self setNeedsDisplay];
}

- (void) setFaceup:(BOOL)faceup {
    _faceup = faceup;
    [self setNeedsDisplay];
}

- (NSString *)rankAsString
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}

#pragma mark - Drawing

#define CORNER_FONT_STANDHRD_HEIGHT 100.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height/CORNER_FONT_STANDHRD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }

- (void) drawRect:(CGRect)rect {
    
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundedRect addClip];
    
    // white background
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds); //fills rectangle
    
    // black line arround the card
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    [self drawCorners];
    
}

- (void)drawCorners
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit] attributes:@{ NSFontAttributeName : cornerFont, NSParagraphStyleAttributeName : paragraphStyle }];
    
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
}

#pragma mark - Initialization

- (void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
