//
//  ZZRScrollView.m
//  ZZRShowImageView
//
//  Created by 张忠瑞 on 2017/6/12.
//  Copyright © 2017年 张忠瑞. All rights reserved.
//

#import "ZZRScrollView.h"

@interface ZZRScrollView ()<UIScrollViewDelegate>

@property (nonatomic ,strong) UIScrollView              *mainScrollView;
@property (nonatomic ,strong) UIImageView               *leftImageView;
@property (nonatomic ,strong) UIImageView               *middleImageView;
@property (nonatomic ,strong) UIImageView               *rightImageView;
@property (nonatomic ,strong) UIPageControl             *pageControl;

@property (nonatomic ,assign) CGFloat                    scrollWidth;
@property (nonatomic ,assign) CGFloat                    scrollHeight;

@property (nonatomic ,retain) NSArray                   *imagesArr;
@property (nonatomic ,assign) NSInteger                  imageNum;          //图片个数
@property (nonatomic ,assign) NSInteger                  currentIndex;      //当前状态下标


@end


@implementation ZZRScrollView


- (instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        _scrollWidth = frame.size.width;
        _scrollHeight = frame.size.height;
        
        
        self.mainScrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.mainScrollView.pagingEnabled = YES;
        self.mainScrollView.delegate = self;
        self.mainScrollView.contentSize = CGSizeMake(_scrollWidth * 3, _scrollHeight);
        self.mainScrollView.contentOffset = CGPointMake(_scrollWidth, 0);
        self.mainScrollView.showsHorizontalScrollIndicator = NO;
        
        self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _scrollWidth, _scrollHeight)];
        self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.middleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollWidth, 0, _scrollWidth, _scrollHeight)];
        self.middleImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollWidth * 2, 0, _scrollWidth, _scrollHeight)];
        self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(_scrollWidth/2-100, _scrollHeight - 50, 200, 50)];
        
        
        [self addSubview:self.mainScrollView];
        [self.mainScrollView addSubview:self.leftImageView];
        [self.mainScrollView addSubview:self.middleImageView];
        [self.mainScrollView addSubview:self.rightImageView];
        [self addSubview:self.pageControl];
    }
    
    
    return self;
}


- (void)setUpViewWithImageUrls:(NSArray *)aUrls
{
    _currentIndex = 0;
    _imagesArr = aUrls;
    _imageNum = [_imagesArr count];
    
    self.leftImageView.backgroundColor = [_imagesArr objectAtIndex:_imageNum-1];
    self.middleImageView.backgroundColor = [_imagesArr objectAtIndex:_currentIndex];
    self.rightImageView.backgroundColor = [_imagesArr objectAtIndex:_currentIndex+1];
    
    self.pageControl.currentPage = _currentIndex;
    self.pageControl.numberOfPages = _imageNum;
    
}


- (void)upDateImageAndContentOffset
{
    self.pageControl.currentPage = _currentIndex;
    
    self.middleImageView.backgroundColor = [_imagesArr objectAtIndex:_currentIndex];

    //如果显示的是第一张图
    if(_currentIndex == 0)
    {
        self.leftImageView.backgroundColor = [_imagesArr objectAtIndex:_imageNum-1];
    }
    else
    {
        self.leftImageView.backgroundColor = [_imagesArr objectAtIndex:_currentIndex-1];
    }
    
    //如果显示的是最后一张图
    if(_currentIndex == _imageNum-1)
    {
        self.rightImageView.backgroundColor = [_imagesArr objectAtIndex:0];
    }
    else
    {
        self.rightImageView.backgroundColor = [_imagesArr objectAtIndex:_currentIndex+1];
    }
    
    
    self.mainScrollView.contentOffset = CGPointMake(_scrollWidth, 0);
}


#pragma mark -
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x == 0)
    {
        //每次左滑下标-1.
        _currentIndex--;
        //当到达第一张的时候
        if(_currentIndex < 0)
        {
            _currentIndex = _imageNum - 1;
        }
        
        [self upDateImageAndContentOffset];
    
    }
    
    if(scrollView.contentOffset.x == _scrollWidth * 2)
    {
        //每次又滑下标+1.
        _currentIndex++;
        //当到达最后一张的时候
        if(_currentIndex == _imageNum)
        {
            _currentIndex = 0;
        }
        [self upDateImageAndContentOffset];
    }
}










@end
