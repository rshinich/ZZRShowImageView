//
//  ViewController.m
//  ZZRShowImageView
//
//  Created by 张忠瑞 on 2017/6/12.
//  Copyright © 2017年 张忠瑞. All rights reserved.
//

#import "ViewController.h"
#import "ZZRScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *arr = @[[UIColor redColor],
                     [UIColor orangeColor],
                     [UIColor yellowColor],
                     [UIColor greenColor],
                     [UIColor blueColor],
                     [UIColor purpleColor]];
    
    
    
    ZZRScrollView *scrollView = [[ZZRScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    [scrollView setUpViewWithImageUrls:arr];
    
    
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
