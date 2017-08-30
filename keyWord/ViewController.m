//
//  ViewController.m
//  keyWord
//
//  Created by jerry on 2017/8/30.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

#import <RegexKitLite.h>

@interface ViewController ()

@property (strong, nonatomic) NSString *keyWords;

@property (nonatomic,weak) UILabel * label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 100)];
    self.keyWords = @"卡";
    label.numberOfLines = 0;
    label.text = @"我爱你阿斯达撒所大所大所大所深囧啊手机都开始考虑就是带你飞联科技是导航翻山倒海的按时撒旦加班撒的付款部署到接收到发哦卡打了卡是开卷的是带你飞；了惊世毒妃收到了；看风使舵立刻打飞机撒来看。";
     [self.view addSubview:label];
    self.label = label;
}

// 查找关键字
-(NSAttributedString *)titleLabText:(NSString *)title {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:title];
    //匹配搜索关键字，并且改变颜色
    if(self.keyWords.length >0) {
        [title enumerateStringsMatchedByRegex:self.keyWords usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
            [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:*capturedRanges];
        }];
    }
    return attributeString;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.label.attributedText = [self titleLabText:self.label.text];
}


@end
