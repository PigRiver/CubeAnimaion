//
//  ViewController.m
//  BZDCubeAnimation
//
//  Created by Bruce on 15-4-3.
//  Copyright (c) 2015年 com.Bruce.BZP. All rights reserved.
//

#import "ViewController.h"
#import "BZDCubeLayer.h"

#import "BZDGroupCubesLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BZDGroupCubesLayer *layer = [[BZDGroupCubesLayer alloc] init];
    layer.bounds = (CGRect){{0,0},{300,300}};
    layer.position = CGPointMake(120, 100);
    [self.view.layer addSublayer:layer];
    [layer leftAnimation];
    [NSTimer scheduledTimerWithTimeInterval:6 * ANIMATION_DURATION target:layer
                                   selector:@selector(leftAnimation) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
