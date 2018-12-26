//
//  KKPaddingLabel.m
//  PaddingLabel
//
//  Created by Cocoa on 2018/12/25.
//  Copyright © 2018年 cocoa. All rights reserved.
//

#import "KKPaddingLabel.h"

@interface KKPaddingLabel ()

@property (nonatomic, strong) CAShapeLayer *maskLayer;


@end

@implementation KKPaddingLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cornerRadius = 3.0f;
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _cornerRadius = 3.0f;
    }
    return self;
}

- (void)setPadding:(UIEdgeInsets)padding {
    self.top_padding = padding.top;
    self.left_padding = padding.left;
    self.right_padding = padding.right;
    self.bottom_padding = padding.bottom;
}
- (UIEdgeInsets)padding {
    return UIEdgeInsetsMake(self.top_padding, self.left_padding, self.bottom_padding, self.right_padding);
}




- (void)setupUI {
    if (self.maskLayer == nil) {
        self.maskLayer = [CAShapeLayer layer];
        self.layer.mask = self.maskLayer;
//        [self.borderColor setStroke];
    }
    CAShapeLayer *maskLayer = self.maskLayer;
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineWidth = self.borderWidth;
    
    
    CGFloat v_W = self.bounds.size.width;
    CGFloat v_H = self.bounds.size.height;
    CGPoint top_right_ArcCenter = CGPointMake(v_W - _cornerRadius, _cornerRadius);
    CGPoint top_left_ArcCenter = CGPointMake(_cornerRadius, _cornerRadius);
    CGPoint bottom_left_ArcCenter = CGPointMake(_cornerRadius, v_H - _cornerRadius);
    CGPoint bottom_right_ArcCenter = CGPointMake(v_W - _cornerRadius, v_H - _cornerRadius);
    
    [path moveToPoint:CGPointMake(0, v_H - _cornerRadius)];
    
    [path addLineToPoint:CGPointMake(0, _cornerRadius)];
    [path addArcWithCenter:top_left_ArcCenter radius:_cornerRadius startAngle:-M_PI endAngle:-M_PI_2 clockwise:YES];
    
    [path addLineToPoint:CGPointMake(v_W - _cornerRadius, 0)];
    [path addArcWithCenter:top_right_ArcCenter radius:_cornerRadius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
    
    [path addLineToPoint:CGPointMake(v_W, v_H - _cornerRadius)];
    [path addArcWithCenter:bottom_right_ArcCenter radius:_cornerRadius startAngle:-M_PI*2 endAngle:-M_PI-M_PI_2 clockwise:YES];
    
    [path addLineToPoint:CGPointMake(_cornerRadius, v_H)];
    [path addArcWithCenter:bottom_left_ArcCenter radius:_cornerRadius startAngle:-M_PI-M_PI_2 endAngle:-M_PI clockwise:YES];
    [path closePath];
    
    maskLayer.path = path.CGPath;
//    self.layer.mask = maskLayer;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.padding)];
}

- (CGSize)intrinsicContentSize {
    CGSize superContentSize = [super intrinsicContentSize];
    CGFloat width = superContentSize.width + self.left_padding + self.right_padding;
    CGFloat height = superContentSize.height + self.top_padding + self.bottom_padding;
    return CGSizeMake(width, height);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
}

@end
