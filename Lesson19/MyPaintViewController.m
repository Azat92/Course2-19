//
//  MyPaintViewController.m
//  Lesson19
//
//  Created by Мария Тимофеева on 29.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MyPaintViewController.h"

@interface MyPaintViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property(nonatomic, strong) UIColor *color;
@property (nonatomic, readonly) CGContextRef context;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

@implementation MyPaintViewController
@synthesize context = _context;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.color = [UIColor blackColor];
 }



- (CGContextRef)context {
    if (!_context) {
        UIGraphicsBeginImageContextWithOptions(self.image.bounds.size, NO, UIScreen.mainScreen.scale);
        _context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(_context, 1);
        CGContextSetStrokeColorWithColor(_context, [self.color CGColor]);
    }
    return _context;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint pnt = [touches.anyObject locationInView:self.image];
    CGContextMoveToPoint(self.context, pnt.x, pnt.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint pnt = [touches.anyObject locationInView:self.image];
    CGContextAddLineToPoint(self.context, pnt.x, pnt.y);
    CGContextStrokePath(self.context);
    self.image.image = UIGraphicsGetImageFromCurrentImageContext();
    CGContextMoveToPoint(self.context, pnt.x, pnt.y);
}

-(IBAction)setCurrentColor:(id)sender {
    
        if ([sender  tag] == 0) self.color = [UIColor whiteColor];
        else if ([sender tag] == 1 ) self.color = [UIColor blackColor];
        else if ([sender tag] == 2 ) self.color = [UIColor blueColor];
        else if ([sender tag] == 3 ) self.color = [UIColor redColor];
        else if ([sender tag] == 4 ) self.color = [UIColor greenColor];
        else self.color = [UIColor cyanColor];
        CGContextSetStrokeColorWithColor(_context, [self.color CGColor]);
    
}




- (IBAction)setCurrentSize:(id)sender {
     CGContextSetLineWidth(_context, [self.slider value]);
}


@end
