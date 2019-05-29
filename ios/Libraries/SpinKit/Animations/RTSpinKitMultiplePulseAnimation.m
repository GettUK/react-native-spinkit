//
// RTSpinKitPulseAnimation.m
// SpinKit
//
// Copyright (c) 2014 Ramon Torres
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "RTSpinKitMultiplePulseAnimation.h"

@implementation RTSpinKitMultiplePulseAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    NSTimeInterval beginTime = CACurrentMediaTime();

    CALayer *circle = [CALayer layer];
    circle.frame = CGRectInset(CGRectMake(0.0, 0.0, size.width, size.height), 2.0, 2.0);
    circle.backgroundColor = color.CGColor;
    circle.anchorPoint = CGPointMake(0.5, 0.5);
    circle.opacity = 1.0;
    circle.cornerRadius = CGRectGetHeight(circle.bounds) * 0.5;
    circle.transform = CATransform3DMakeScale(0.0, 0.0, 0.0);

    CALayer *circle2 = [CALayer layer];
    circle2.frame = CGRectInset(CGRectMake(0.0, 0.0, size.width, size.height), 2.0, 2.0);
    circle2.backgroundColor = color.CGColor;
    circle2.anchorPoint = CGPointMake(0.5, 0.5);
    circle2.opacity = 1.0;
    circle2.cornerRadius = CGRectGetHeight(circle.bounds) * 0.5;
    circle2.transform = CATransform3DMakeScale(0.0, 0.0, 0.0);

    CALayer *circle3 = [CALayer layer];
    circle3.frame = CGRectInset(CGRectMake(0.0, 0.0, size.width, size.height), 2.0, 2.0);
    circle3.backgroundColor = color.CGColor;
    circle3.anchorPoint = CGPointMake(0.5, 0.5);
    circle3.opacity = 1.0;
    circle3.cornerRadius = CGRectGetHeight(circle.bounds) * 0.5;
    circle3.transform = CATransform3DMakeScale(0.0, 0.0, 0.0);

    CAKeyframeAnimation *scaleAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnim.values = @[
        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)],
        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)]
    ];

    CAKeyframeAnimation *opacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.values = @[@(1.0), @(0.0)];

    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.removedOnCompletion = NO;
    animGroup.beginTime = beginTime;
    animGroup.repeatCount = HUGE_VALF;
    animGroup.duration = 3.0;
    animGroup.animations = @[scaleAnim, opacityAnim];
    animGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    CAAnimationGroup *animGroup2 = [CAAnimationGroup animation];
    animGroup2.removedOnCompletion = NO;
    animGroup2.beginTime = beginTime + 1;
    animGroup2.repeatCount = HUGE_VALF;
    animGroup2.duration = 3.0;
    animGroup2.animations = @[scaleAnim, opacityAnim];
    animGroup2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    CAAnimationGroup *animGroup3 = [CAAnimationGroup animation];
    animGroup3.removedOnCompletion = NO;
    animGroup3.beginTime = beginTime + 2;
    animGroup3.repeatCount = HUGE_VALF;
    animGroup3.duration = 3.0;
    animGroup3.animations = @[scaleAnim, opacityAnim];
    animGroup3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [layer addSublayer:circle];
    [layer addSublayer:circle2];
    [layer addSublayer:circle3];
    [circle addAnimation:animGroup forKey:@"spinkit-anim"];
    [circle2 addAnimation:animGroup2 forKey:@"spinkit-anim"];
    [circle3 addAnimation:animGroup3 forKey:@"spinkit-anim"];
}

@end
