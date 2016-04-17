//
//  HintViewController.m
//  Lesson19
//
//  Created by Azat Almeev on 17.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "HintViewController.h"

@interface HintViewController ()

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *hintLabels;

@end

@implementation HintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UILabel *label in self.hintLabels)
        label.textColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.view setNeedsDisplay];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
