//
//  ScaleAnimation.m
//  VCTransitions
//
//  Created by Tyler Tillage on 9/2/13.
//  Copyright (c) 2013 CapTech. All rights reserved.
//

#import "ScaleAnimation.h"

@interface ScaleAnimation() {
    CGFloat _startScale, _completionSpeed;
    id<UIViewControllerContextTransitioning> _context;
    UIView *_transitioningView;
    UIPinchGestureRecognizer *_pinchRecognizer;
    
}

-(void)updateWithPercent:(CGFloat)percent;
-(void)end:(BOOL)cancelled;

@property (strong, nonatomic) UIView* btnView;
@property (assign, nonatomic) CGRect originRect;
@property (strong ,nonatomic) UIView* animationView;

@property (assign, nonatomic) id contexts;
@property (strong, nonatomic) UIView* containerView;
@property (assign, nonatomic) CGFloat radius;
@property (strong, nonatomic) CAShapeLayer* shapeLayer;
@end

#define kRotationAnimation @"RotationAnimation"
@implementation ScaleAnimation

@synthesize viewForInteraction = _viewForInteraction;

-(instancetype)initWithNavigationController:(UINavigationController *)controller {
    self = [super init];
    if (self) {
        self.navigationController = controller;
        _completionSpeed = 0.2;
        
        _pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    }
    return self;
}

- (instancetype)initWithView:(UIView *)btnView
{
    if (self = [super init]) {
        
        NSAssert(btnView, @"btnView 不能为空");
        _btnView = btnView;
        _originRect = btnView.frame;
    }
    return self;
}


-(void)setViewForInteraction:(UIView *)viewForInteraction {
    if (_viewForInteraction && [_viewForInteraction.gestureRecognizers containsObject:_pinchRecognizer]) [_viewForInteraction removeGestureRecognizer:_pinchRecognizer];
    
    _viewForInteraction = viewForInteraction;
    [_viewForInteraction addGestureRecognizer:_pinchRecognizer];
}

#pragma mark - Animated Transitioning

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
//    
//    if (self.reverse)
//    {
//        CGSize screenSize = [UIScreen mainScreen].bounds.size;
//        CGFloat size = MAX(screenSize.width, screenSize.height) * 1.2;
//        CATransform3D fina3D = CATransform3DMakeScale((self.btnView.frame.size.width/size) * 1.4, (self.btnView.frame.size.height/size) * 1.4, 1);
//        
//        UIViewController* toVC = [_context viewControllerForKey:UITransitionContextToViewControllerKey];
//        toVC.view.frame = [UIScreen mainScreen].bounds;
//        toVC.view.alpha = 0;
//        
//        self.animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAX(screenSize.width, screenSize.height) * 1.8, MAX(screenSize.width, screenSize.height) * 1.8)];
//        self.animationView.center = self.btnView.center;
//        self.animationView.layer.cornerRadius = MAX(screenSize.width, screenSize.height) * 0.9;
//        self.animationView.layer.masksToBounds = YES;
//        [self.containerView addSubview:toVC.view];
//        [self.containerView addSubview:self.animationView];
//        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext]*0.6 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//            toVC.view.alpha = 1;
//            self.animationView.backgroundColor = self.btnView.backgroundColor;
//            self.animationView.layer.transform = fina3D;
//        } completion:^(BOOL finished) {
//            self.animationView.layer.cornerRadius = 0;
//        }];
//        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext]*0.3 delay:[self transitionDuration:transitionContext]*0.6 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
//            self.animationView.frame = _originRect;
//            
//        } completion:^(BOOL finished) {
//            self.btnView.hidden = NO;
//            [self.animationView removeFromSuperview];
//            [self.containerView addSubview:toVC.view];
//            [_context completeTransition:YES];
//        }];
//    }else
//    {
//        self.animationView = [[UIView alloc] initWithFrame:self.btnView.frame];
//        self.animationView.layer.cornerRadius = 4;
//        self.animationView.layer.masksToBounds = YES;
//        self.animationView.frame = self.btnView.frame;
//        self.animationView.backgroundColor = self.btnView.backgroundColor;
//        self.btnView.hidden = YES;
//        
//        
//        [self.containerView addSubview:self.animationView];
//        
//        CGPoint centerPoint = self.btnView.center;
//        self.radius = MIN(self.btnView.frame.size.width, self.btnView.frame.size.height);
//        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext]*0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            
//            self.animationView.frame = CGRectMake(0, 0, self.radius, self.radius);
//            self.animationView.center = centerPoint;
//            self.animationView.layer.cornerRadius = self.radius/2;
//            self.animationView.layer.masksToBounds = YES;
//            
//        } completion:^(BOOL finished) {
//            
//            UIBezierPath* path = [[UIBezierPath alloc] init];
//            [path addArcWithCenter:CGPointMake(self.radius/2, self.radius/2) radius:(self.radius/2 - 5) startAngle:0 endAngle:M_PI_2 * 2 clockwise:YES];
//            self.shapeLayer = [[CAShapeLayer alloc] init];
//            self.shapeLayer.lineWidth = 1;
//            self.shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
//            self.shapeLayer.fillColor = self.btnView.backgroundColor.CGColor;
//            self.shapeLayer.frame = CGRectMake(0, 0, self.radius, self.radius);
//            self.shapeLayer.path = path.CGPath;
//            [self.animationView.layer addSublayer:self.shapeLayer];
//            
//            CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//            baseAnimation.duration = 0.4;
//            baseAnimation.fromValue = @(0);
//            baseAnimation.toValue = @(2 * M_PI);
//            baseAnimation.repeatCount = MAXFLOAT;
//            [self.animationView.layer addAnimation:baseAnimation forKey:kRotationAnimation];
//        }];
//    }

    
    
    //Get references to the view hierarchy
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.type == AnimationTypePresent) {
        //Add 'to' view to the hierarchy with 0.0 scale
        toViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
        
        //Scale the 'to' view to to its final position
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else if (self.type == AnimationTypeDismiss) {
        //Add 'to' view to the hierarchy
         toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        //Scale the 'from' view down until it disappears
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

-(void)animationEnded:(BOOL)transitionCompleted {
    self.interactive = NO;
}

#pragma mark - Interactive Transitioning

-(void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //Maintain reference to context
    _context = transitionContext;
    
    //Get references to view hierarchy
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //Insert 'to' view into hierarchy
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    //Save reference for view to be scaled
    _transitioningView = fromViewController.view;
}

-(void)updateWithPercent:(CGFloat)percent {
    CGFloat scale = fabsf(percent-1.0);
    _transitioningView.transform = CGAffineTransformMakeScale(scale, scale);
    [_context updateInteractiveTransition:percent];
}

-(void)end:(BOOL)cancelled {
    if (cancelled) {
        [UIView animateWithDuration:_completionSpeed animations:^{
            _transitioningView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            [_context cancelInteractiveTransition];
            [_context completeTransition:NO];
        }];
    } else {
        [UIView animateWithDuration:_completionSpeed animations:^{
            _transitioningView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        } completion:^(BOOL finished) {
            [_context finishInteractiveTransition];
            [_context completeTransition:YES];
        }];
    }
}

- (void)stopAnimation
{
    UIViewController* toVC = [_context viewControllerForKey:UITransitionContextToViewControllerKey];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    toVC.view.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
    [self.containerView addSubview:toVC.view];
    toVC.view.alpha = 0;
    self.animationView.layer.transform = CATransform3DIdentity;
    
    [self.shapeLayer removeFromSuperlayer];
    
    [self.animationView.layer removeAllAnimations];
    
    CGFloat size = MAX(toVC.view.frame.size.width, toVC.view.frame.size.height) * 1.6;
    CATransform3D fina3D = CATransform3DMakeScale(size/self.radius, size/self.radius, 1);
    [UIView animateWithDuration:0.5 animations:^{
        
        self.animationView.layer.transform = fina3D;
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [self.animationView removeFromSuperview];
        [_context completeTransition:YES];
    }];
}




-(void)handlePinch:(UIPinchGestureRecognizer *)pinch {
    CGFloat scale = pinch.scale;
	switch (pinch.state) {
		case UIGestureRecognizerStateBegan:
            _startScale = scale;
            self.interactive = YES;
            [self.navigationController popViewControllerAnimated:YES];
            break;
		case UIGestureRecognizerStateChanged: {
            CGFloat percent = (1.0 - scale/_startScale);
            [self updateWithPercent:(percent < 0.0) ? 0.0 : percent];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            CGFloat percent = (1.0 - scale/_startScale);
            BOOL cancelled = ([pinch velocity] < 5.0 && percent <= 0.3);
            [self end:cancelled];
            break;
        }
        case UIGestureRecognizerStateCancelled: {
            CGFloat percent = (1.0 - scale/_startScale);
            BOOL cancelled = ([pinch velocity] < 5.0 && percent <= 0.3);
            [self end:cancelled];
            break;
        }
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateFailed:
            break;
    }
}


@end
