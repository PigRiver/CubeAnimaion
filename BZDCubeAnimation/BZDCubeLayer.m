//
//  BZDCubeLayer.m
//  BZDCubeAnimation
//
//  Created by Bruce on 15-4-3.
//  Copyright (c) 2015年 com.Bruce.BZP. All rights reserved.
//

#import "BZDCubeLayer.h"

@implementation BZDCubeLayer

- (id)init {
    self = [super init];
    if (self) {
        [self configCubeLayer];
    }
    
    return self;
}

- (void)configCubeLayer {
    CATransform3D transform;
    
    CALayer *leftLayer = [self configSideLayer];
    leftLayer.backgroundColor = [UIColor greenColor].CGColor;
    transform = CATransform3DMakeTranslation(CUBE_LENGTH / -2, 0, 0);
    transform = CATransform3DRotate(transform, [self calculate:90], 0, 1.0, 0);
    leftLayer.transform = transform;
    
    CALayer *rightLayer = [self configSideLayer];
    rightLayer.backgroundColor = [UIColor greenColor].CGColor;
    transform = CATransform3DMakeTranslation(CUBE_LENGTH / 2, 0, 0);
    transform = CATransform3DRotate(transform, [self calculate:90], 0, 1.0, 0);
    rightLayer.transform = transform;
    
    CALayer *topLayer = [self configSideLayer];
    topLayer.backgroundColor = [UIColor blueColor].CGColor;
    transform = CATransform3DMakeTranslation(0, CUBE_LENGTH / -2, 0);
    transform = CATransform3DRotate(transform, [self calculate:90], 1.0, 0, 0);
    topLayer.transform = transform;
    
    CALayer *bottomLayer = [self configSideLayer];
    bottomLayer.backgroundColor = [UIColor blueColor].CGColor;
    transform = CATransform3DMakeTranslation(0, CUBE_LENGTH / 2, 0);
    transform = CATransform3DRotate(transform, [self calculate:90], 1.0, 0, 0);
    bottomLayer.transform = transform;
    
    CALayer *frontLayer = [self configSideLayer];
    frontLayer.backgroundColor = [UIColor purpleColor].CGColor;
    transform = CATransform3DMakeRotation(0, 0, 0, 0);
    transform = CATransform3DTranslate(transform, 0, 0, CUBE_LENGTH / 2);
    frontLayer.transform = transform;
    
    CALayer *backLayer = [self configSideLayer];
    backLayer.backgroundColor = [UIColor purpleColor].CGColor;
    transform = CATransform3DMakeTranslation(0, 0, -CUBE_LENGTH / 2);
    backLayer.transform = transform;
    
    
    transform = CATransform3DMakeRotation(M_PI/6, -1, 0, 0);
    transform = CATransform3DRotate(transform, M_PI/6, 0, -1, 0);
    self.sublayerTransform = transform;
    
    return;
}

- (CALayer *)configSideLayer {
    CALayer *sideLayer = [CALayer layer];
    sideLayer.bounds = CGRectMake(0, 0, CUBE_LENGTH, CUBE_LENGTH);
    sideLayer.position = self.position;
    [self addSublayer:sideLayer];
    
    return sideLayer;
}

- (CGFloat)calculate:(CGFloat)degree {
    return degree * M_PI / 180.0;
}

@end
