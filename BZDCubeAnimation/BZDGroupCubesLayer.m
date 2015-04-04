//
//  BZDGroupCubesLayer.m
//  BZDCubeAnimation
//
//  Created by Bruce on 15-4-3.
//  Copyright (c) 2015年 com.Bruce.BZP. All rights reserved.
//

#import "BZDGroupCubesLayer.h"
#import <math.h>

@interface BZDGroupCubesLayer()

@property (nonatomic) CGFloat cubeDistance;
@property (nonatomic, strong) NSMutableArray *top1;
@property (nonatomic, strong) NSMutableArray *top2;
@property (nonatomic, strong) NSMutableArray *top3;

@property (nonatomic, strong) NSMutableArray *left1;
@property (nonatomic, strong) NSMutableArray *left2;
@property (nonatomic, strong) NSMutableArray *left3;

@property (nonatomic, strong) NSMutableArray *front1;
@property (nonatomic, strong) NSMutableArray *front2;
@property (nonatomic, strong) NSMutableArray *front3;

@end

@implementation BZDGroupCubesLayer

- (id)init {
    self = [super init];
    if (self) {
        [self configList];
        [self configLayers];
    }
    
    return self;
}

- (void)configList {
    self.top1 = [[NSMutableArray alloc] init];
    self.top2 = [[NSMutableArray alloc] init];
    self.top3 = [[NSMutableArray alloc] init];
    self.left1 = [[NSMutableArray alloc] init];
    self.left2 = [[NSMutableArray alloc] init];
    self.left3 = [[NSMutableArray alloc] init];
    self.front1 = [[NSMutableArray alloc] init];
    self.front2 = [[NSMutableArray alloc] init];
    self.front3 = [[NSMutableArray alloc] init];
}

- (void)configLayers {
    CGPoint originPoint = CGPointMake(200 , 200);
    CGFloat originHeight = self.cubeDistance * 2;
    for (int i = 0; i < 3; i++) {
        CGFloat height = originHeight - self.cubeDistance * i;
        
        for (int j = 0; j < 3; j++) {
            CGFloat width = self.cubeDistance * j;
            
            for (int k = 0; k < 3; k++) {
                BZDCubeLayer *cubeLayer = [[BZDCubeLayer alloc] init];
                cubeLayer.position = originPoint;
                [self addSublayer:cubeLayer];
                
                switch (i) {
                    case 0:
                        [self.top1 addObject:cubeLayer];
                        break;
                    case 1:
                        [self.top2 addObject:cubeLayer];
                        break;
                    case 2:
                        [self.top3 addObject:cubeLayer];
                        break;
                    default:
                        break;
                }
                
                switch (j) {
                    case 0:
                        [self.left1 addObject:cubeLayer];
                        break;
                    case 1:
                        [self.left2 addObject:cubeLayer];
                        break;
                    case 2:
                        [self.left3 addObject:cubeLayer];
                        break;
                    default:
                        break;
                }
                
                switch (k) {
                    case 0:
                        [self.front1 addObject:cubeLayer];
                        break;
                    case 1:
                        [self.front2 addObject:cubeLayer];
                        break;
                    case 2:
                        [self.front3 addObject:cubeLayer];
                        break;
                    default:
                        break;
                }
                CGFloat length = self.cubeDistance * k;
                CATransform3D transform = cubeLayer.sublayerTransform;
                cubeLayer.sublayerTransform = CATransform3DTranslate(transform, width, height, length);
            }// for k
        }// for j
    }// for i
}

- (void)leftAnimation {
    [CATransaction begin];
    [CATransaction setAnimationDuration:ANIMATION_DURATION];

    for (CALayer *cubeLayer in self.left1) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, -ANIMATION_DISTANCE, 0, 0);
    }
    for (CALayer *cubeLayer in self.left3) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, ANIMATION_DISTANCE, 0, 0);
    }
    
    [CATransaction commit];
    [self performSelector:@selector(frontAnimation) withObject:nil afterDelay:ANIMATION_DURATION];
}

- (void)frontAnimation {
    [CATransaction begin];
    [CATransaction setAnimationDuration:ANIMATION_DURATION];
    for (CALayer *cubeLayer in self.front1) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, 0, -ANIMATION_DISTANCE);
    }
    for (CALayer *cubeLayer in self.front3) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, 0, ANIMATION_DISTANCE);

    }
    [CATransaction commit];
    [self performSelector:@selector(topAnimation) withObject:nil afterDelay:ANIMATION_DURATION];
}

- (void)topAnimation {
    [CATransaction begin];
    [CATransaction setAnimationDuration:ANIMATION_DURATION];
    for (CALayer *cubeLayer in self.top1) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, ANIMATION_DISTANCE, 0);
    }
    for (CALayer *cubeLayer in self.top3) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, -ANIMATION_DISTANCE, 0);
    }
    [CATransaction commit];
    [self performSelector:@selector(leftReturnBack) withObject:nil afterDelay:ANIMATION_DURATION];
}

- (void)leftReturnBack {
    [CATransaction begin];
    [CATransaction setAnimationDuration:ANIMATION_DURATION];
    
    for (CALayer *cubeLayer in self.left1) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, ANIMATION_DISTANCE, 0, 0);

    }
    for (CALayer *cubeLayer in self.left3) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, -ANIMATION_DISTANCE, 0, 0);
    }
    
    [CATransaction commit];
    [self performSelector:@selector(frontReturnBack) withObject:nil afterDelay:ANIMATION_DURATION];
}

- (void)frontReturnBack {
    [CATransaction begin];
    [CATransaction setAnimationDuration:ANIMATION_DURATION];
    
    
    for (CALayer *cubeLayer in self.front1) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, 0, ANIMATION_DISTANCE);
    }
    for (CALayer *cubeLayer in self.front3) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, 0, -ANIMATION_DISTANCE);
    }
    [CATransaction commit];
    [self performSelector:@selector(topReturnBack) withObject:nil afterDelay:ANIMATION_DURATION];
}

- (void)topReturnBack {
    [CATransaction begin];
    [CATransaction setAnimationDuration:ANIMATION_DURATION];
    
    for (CALayer *cubeLayer in self.top1) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, -ANIMATION_DISTANCE, 0);
    }
    for (CALayer *cubeLayer in self.top3) {
        CATransform3D transform = cubeLayer.sublayerTransform;
        cubeLayer.sublayerTransform = CATransform3DTranslate(transform, 0, ANIMATION_DISTANCE, 0);
    }
    [CATransaction commit];
    
}

- (CGFloat)cubeDistance {
    if (_cubeDistance <= 0) {
        _cubeDistance = sqrt(3.0) * CUBE_LENGTH / 2;
    }
    
    return _cubeDistance;
}

@end
