//
//  ViewController.m
//  PaddingLabel
//
//  Created by Cocoa on 2018/12/25.
//  Copyright © 2018年 cocoa. All rights reserved.
//

#import "ViewController.h"
#import "KKPaddingLabel.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLabel];
}

- (void)addLabel {
    KKPaddingLabel *paddingLabel = [[KKPaddingLabel alloc] initWithFrame:CGRectZero];
    paddingLabel.text = @"KKPaddingLabel";
    paddingLabel.backgroundColor = [UIColor lightGrayColor];
    paddingLabel.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    paddingLabel.cornerRadius = 5.0f;
    paddingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:paddingLabel];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:paddingLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:paddingLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100.0f]];
    
    [paddingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(200);
        make.left.equalTo(self.view).with.offset(100);
    }];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}


@end
