//
//  ViewController.m
//  superCard
//
//  Created by epeuva on 23/07/2018
//  Copyright © 2018 epeuva. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.playingCardView.suit = @"♥";// ♥
    self.playingCardView.rank = 13;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
