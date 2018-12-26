# KKPaddingLabel 

###### 可以给Label添加内边距，支持xib可视化修改，支持autolayout/masonry约束
![xib可视化编辑内边距](https://github.com/cocoZ/photos/blob/master/KKPaddingLabel2.mov.gif?raw=true "示例图")

## 代码效果-灰色背景的Label, Masonry约束效果相同 
## xib效果-粉红色背景的Label
    KKPaddingLabel *paddingLabel = [[KKPaddingLabel alloc] initWithFrame:CGRectZero];
    paddingLabel.text = @"KKPaddingLabel";
    paddingLabel.backgroundColor = [UIColor lightGrayColor];
    paddingLabel.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    paddingLabel.cornerRadius = 5.0f;
    paddingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:paddingLabel];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:paddingLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:paddingLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100.0f]];

![Image text](https://github.com/cocoZ/photos/blob/master/WX20181226-161216@2x.png?raw=true "示例图")
