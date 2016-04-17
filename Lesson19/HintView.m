//
//  PaintView.m
//  Lesson19
//
//  Created by Azat Almeev on 17.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "HintView.h"

@implementation HintView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0 alpha:0.6].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
//    CGRect destFrame = CGRectMake(0, 64 + 4 * 44, rect.size.width, 44);
    UINavigationController *root = (id)[UIApplication sharedApplication].keyWindow.rootViewController;
    UITableViewController *rootTableVC = (id)root.viewControllers.firstObject;
    CGRect frame = [rootTableVC.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    CGRect destFrame = [rootTableVC.tableView convertRect:frame toView:self];
    CGContextClearRect(context, destFrame);
    
    CGContextMoveToPoint(context, 50, 70);
    CGContextAddLineToPoint(context, 30, 45);
    CGContextMoveToPoint(context, rect.size.width - 50, 70);
    CGContextAddLineToPoint(context, rect.size.width - 30, 45);
    CGContextMoveToPoint(context, 60, destFrame.origin.y + destFrame.size.height);
    CGContextAddLineToPoint(context, rect.size.width / 2 - 30, rect.size.height / 2 - 30);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextAddArc(context, 25, 40, 15, 0, 2.0 * M_PI, 0);
    CGContextAddEllipseInRect(context, CGRectMake(rect.size.width - 50, 25, 50, 30));
    CGContextDrawPath(context, kCGPathFill);
}

@end
