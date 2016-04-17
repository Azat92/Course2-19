//
//  PaintViewController.m
//  Lesson19
//
//  Created by Azat Almeev on 17.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "PaintViewController.h"

@interface PaintViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, readonly) CGContextRef context;
@end

@implementation PaintViewController
@synthesize context = _context;

- (CGContextRef)context {
    if (!_context) {
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, UIScreen.mainScreen.scale);
        _context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(_context, 1);
        CGContextSetStrokeColorWithColor(_context, UIColor.blackColor.CGColor);
    }
    return _context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Paint";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint pnt = [touches.anyObject locationInView:self.imageView];
    CGContextMoveToPoint(self.context, pnt.x, pnt.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint pnt = [touches.anyObject locationInView:self.imageView];
    CGContextAddLineToPoint(self.context, pnt.x, pnt.y);
    CGContextStrokePath(self.context);
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    CGContextMoveToPoint(self.context, pnt.x, pnt.y);
}

- (void)dealloc {
    UIGraphicsEndImageContext();
}

@end
