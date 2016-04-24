//
//  ViewControllerB.m
//  popDemo
//
//  Created by 吴珂 on 16/4/8.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@property (nonatomic, strong) UIImageView *tempBar;

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ;
    
//    [self.view addSubview:_tempBar];
    
    NSLog(@"");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
//    self.tempBar = 
//
//    if ([self isMovingToParentViewController]) {
//        NSLog(@"isMovingToParentViewController");
//    }
//    
//    if ([self isMovingFromParentViewController]) {
//        NSLog(@"isMovingFromParentViewController");
//
//    }
    _tempBar.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.interactivePopGestureRecognizer addTarget:self action:@selector(moving:)];
    
    _tempBar = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    _tempBar.image = [self convertViewToImage:[UIApplication sharedApplication].keyWindow];
    
    _tempBar.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moving:(UIGestureRecognizer *)recognizer
{
    NSLog(@"%@", recognizer);
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self.view addSubview:_tempBar];
        _tempBar.hidden = NO;
    }else if(recognizer.state == UIGestureRecognizerStateEnded){
        
    }
}

-(UIImage *)convertViewToImage:(UIView *)view{
    CGSize s = view.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
